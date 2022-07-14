*---------------------------------------------------*
*                  Tables (robust)                  *
*---------------------------------------------------*

******** SI tables
cd D:\code&data
use data\data_sensitivity.dta, clear

xtset id year
global xlist "pop ind ser tech wind temp humi"
*-------------- samples selection & variables --------------------*	
drop if missing(inequality, ind, ser, pop, tech, wind, temp, humi)
drop if prov=="西藏自治区"
drop if (prov=="上海市")|(prov=="北京市")|(prov=="天津市")|(prov=="重庆市")
sort pop
gen poptab=group(2)
sort ind
gen indtab=group(2)
sort ser
gen sertab=group(2)


*------------------- sensitivity analyses ----------------------*
// table s5 - s10
global sens "n_capital n_nature inequality depletion commuting water"
local append replace
foreach v of varlist $sens{
	eststo clear
	cap drop _est*
	eststo a1: qui: reghdfe `v' $xlist if poptab==1, ab(year id) vce(robust)
	eststo a2: qui: reghdfe `v' $xlist if poptab==2, ab(year id) vce(robust)
	eststo a3: qui: reghdfe `v' $xlist if indtab==1, ab(year id) vce(robust)
	eststo a4: qui: reghdfe `v' $xlist if indtab==2, ab(year id) vce(robust)
	eststo a5: qui: reghdfe `v' $xlist if sertab==1, ab(year id) vce(robust)
	eststo a6: qui: reghdfe `v' $xlist if sertab==2, ab(year id) vce(robust)

	esttab a* using tables/pro_sensitivity_r.rtf, `append' ///
		scalar(N r2_a F) b(%9.3f) ar2(%9.3f) se compress nogap ///
		mtitles(low_pop high_pop low_ind high_ind low_ser high_ser) ///
		star(* 0.1 ** 0.05 *** 0.01)  title("sensitivity analyses: `v'")
	
	local append append
}