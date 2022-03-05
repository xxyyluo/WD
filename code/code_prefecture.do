cd D:\work\Study_GPI_group\投稿\投稿后续\新用数据\地级市数据
use data_prefecture.dta,replace


rename 时间 year
xtset id  year


gen SGPIpGDP=SGPI/GDP
gen GPIpGDP=GPI/GDP



global xlist "ind ser pop tech wind temp humi"						  
logout, save(Descriptive_Statistics)word replace: tabstat  SGPIpGDP GPIpGDP WD $xlist , ///
            stats(count mean sd min  p50   max)  c(s) f(%6.2f)

			
drop if missing(SGPIpGDP, WD, GPIpGDP,ind, ser, pop, tech, wind, temp, humi)

//Main results
xtreg SGPIpGDP  $xlist i.year,fe 
est store m1
xtreg GPIpGDP  $xlist i.year,fe 
est store m2
xtreg WD $xlist i.year,fe 
est store m3
local model "m1 m2 m3"
esttab `model',                          ///
     star(* 0.1 ** 0.05 *** 0.01)        /// 
     scalar(r2 r2_a N F) compress nogap 
outreg2 [m1 m2 m3 ] using GPI01, word replace         ///
              title("SGPI per GDP")                   ///   
			  keep(ind ser pop tech wind temp humi )  ///   
              pdec(3) rdec(3) r2 e(F)                 ///  
			  nonote                                     
         
						  

						  
