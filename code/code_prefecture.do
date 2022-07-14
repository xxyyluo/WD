*---------------------------------------------------*
*                  Tables (robust)                  *
*---------------------------------------------------*

******** prefecture level tables
cd D:\code&data
use data\data_prefecture.dta, clear

xtset id year

gen sgpipgdp=SGPI/GDP
gen gpippgdp=GPI_positive/GDP
gen gpinpgdp=GPI_negative/GDP
gen gpipgdp=GPI/GDP
gen econpgdp=ECON/GDP
gen envpgdp=ENV/GDP
gen socpgdp=SOCIAL/GDP
global xlist "pop ind ser tech wind temp humi"

// descriptive statistics

logout, save(Descriptive_Statistics_prefecture) word replace: tabstat sgpipgdp gpipgdp wd_positive wd_negative $xlist , ///
            stats(count mean sd min p50 max)  c(s) f(%6.3f)

*-------------- samples selection & variables --------------------*			
drop if missing(sgpipgdp, ind, ser, pop, tech, wind, temp, humi)
drop if prov =="西藏自治区"
drop if (prov=="上海市")|(prov=="北京市")|(prov=="天津市")|(prov=="重庆市")

sort pop
gen poptab=group(2)
sort ind
gen indtab=group(2)
sort ser
gen sertab=group(2)


// Table 2
eststo clear
cap drop _est*
eststo a1: qui: reghdfe sgpipgdp $xlist if poptab==1, ab(year id) vce(robust)
eststo a2: qui: reghdfe sgpipgdp $xlist if poptab==2, ab(year id) vce(robust)
eststo a3: qui: reghdfe sgpipgdp $xlist if indtab==1, ab(year id) vce(robust)
eststo a4: qui: reghdfe sgpipgdp $xlist if indtab==2, ab(year id) vce(robust)
eststo a5: qui: reghdfe sgpipgdp $xlist if sertab==1, ab(year id) vce(robust)
eststo a6: qui: reghdfe sgpipgdp $xlist if sertab==2, ab(year id) vce(robust)

esttab a* using tables/prefecture_tables_r.rtf, replace ///
	scalar(N r2_a F) b(%9.3f) ar2(%9.3f) se compress nogap ///
	mtitles(low_pop high_pop low_ind high_ind low_ser high_ser) ///
	star(* 0.1 ** 0.05 *** 0.01) title("table 2")
	
// extended table 4
* main results
eststo clear
cap drop _est*
eststo a1: qui: reghdfe sgpipgdp $xlist, ab(year id) vce(robust)
eststo a2: qui: reghdfe gpipgdp $xlist, ab(year id) vce(robust)

esttab a* using tables/prefecture_tables_r.rtf, append ///
	scalar(N r2_a F) b(%9.3f) ar2(%9.3f) se compress nogap ///
	star(* 0.1 ** 0.05 *** 0.01)  title("ext table 4: prefecture overall")					  
