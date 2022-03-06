cd D:\work\Study_gpi_group\stata\code
use data_provincial.dta,replace
xtset id year



gen rgpipgdp=rgpi/gdp
gen gpipgdp=gpi/gdp
gen econpgdp=econ/gdp
gen envpgdp=env/gdp
gen socpgdp=soc/gdp


global xlist "ind ser pop tech wind temp humi"						  
logout, save(Descriptive_Statistics)word replace: tabstat  rgpipgdp gpipgdp wd $xlist , ///
            stats(count mean sd min  p50   max)  c(s) f(%6.2f)


//Main results
xtreg rgpipgdp  $xlist i.year,fe 
est store m1
xtreg gpipgdp  $xlist i.year,fe 
est store m2
xtreg wd $xlist i.year,fe 
est store m3
local model "m1 m2 m3"
esttab `model',                          ///
     star(* 0.1 ** 0.05 *** 0.01)        /// 
     scalar(r2 r2_a N F) compress nogap 
outreg2 [m1 m2 m3 ] using gpi01, word replace         ///
              title("rgpi per gdp")                   ///   
			  keep(ind ser pop tech wind temp humi )  ///   
              pdec(3) rdec(3) r2 e(F)                 ///   
			  nonote                                     
             
						  
//Account breakdown
xtreg econpgdp $xlist i.year,fe
est store m1
xtreg envpgdp $xlist i.year, fe
est store m2
xtreg socpgdp $xlist i.year,fe
est store m3 
local model "m1 m2 m3"
esttab `model',                          ///
     star(* 0.1 ** 0.05 *** 0.01)        /// 
     scalar(r2 r2_a N F) compress nogap 
outreg2 [m1 m2 m3 ] using gpi02, word replace         ///
              title("account analysis")               ///   
			  keep(ind ser pop tech wind temp humi)   ///  
              pdec(3) rdec(3) r2 e(F)                 ///   
			  nonote                                   
              

						  
///Heterogeneous effects:pop
drop if (prov=="上海市")|(prov=="北京市")|(prov=="天津市")|(prov=="重庆市")
sort pop
gen poptab=group(2)
xtreg rgpipgdp  $xlist i.year if poptab==1 ,fe 
est store m1
xtreg rgpipgdp  $xlist i.year if poptab==2 ,fe 
est store m2
local model "m1 m2"
esttab `model',                           ///
     star(* 0.1 ** 0.05 *** 0.01)         /// 
     scalar(r2 r2_a N F) compress nogap 
outreg2 [m1 m2 ] using gpipop, word replace        ///
              title("rgpi per gdp")                     ///    
			  keep(ind ser pop tech wind temp humi )    ///   
              pdec(3) rdec(3) r2 e(F)                   ///   
			  nonote                                      

						  

///Heterogeneous effects:services
sort ser
gen sertab=group(2)
xtreg rgpipgdp  $xlist i.year if sertab==1 ,fe 
est store m1
xtreg rgpipgdp  $xlist i.year if sertab==2 ,fe 
est store m2

local model "m1 m2"
esttab `model',                          ///
     star(* 0.1 ** 0.05 *** 0.01)        /// 
     scalar(r2 r2_a N F) compress nogap 
outreg2 [m1 m2] using gpiser, word replace            ///
              title("rgpi per gdp")                   ///   
			  keep(ind ser pop tech wind temp humi )  ///   
              pdec(3) rdec(3) r2 e(F)                 ///   
			  nonote                                      
           
