# A new index integrating welfare diversity reveals unbalanced structure of welfare in China
*Xi Ji, Xianling Long, Guowei Wu, Pinyi Su, Xuanyuan Luo, and Robert Costanza*

Data for the manuscript "A new index integrating welfare diversity reveals unbalanced structure of welfare in China".

Data lists: 

(1) 2021.8.6_provincialGPI_compenent_and_measurement.xlsx : raw data for the measurement of provincial GPI compenents (the calculating results of GPI, WD and SGPI are already presented in our paper[^1]);

(2) 2022.7.8_prefecturalGPI_component_and_measurement.xlsx : raw data for the measurement of prefectural GPI compenents[^2];

(3) data_province.dta : data used for the regression models (province level);

(4) data_prefecture.dta : data used for the regression models (prefecture level);

(5) data_sensitivity : data used for the sensitive analyses.

For replication issues, please feel free to contact us at jixi@pku.edu.cn (Xi Ji).


[^1]: The base map of China (for Fig. 2) is obtained from https://github.com/r-stata/stata-prov-map.

[^2]: Since data quality is really bad before 2006, we curtail the research period to 13 years (2006 to 2018) for prefecture-level analysis to ensure the integrity and validity of the data. Even for 2006-2018, many welfare components are still missing. We impute the missing data based on provincial data as reasonable as we can. The imputations include: (1) A city’s consumer durables expenditure per capita and time use are set to the provincial average level; (2) Personal consumption expenditures, cost of industrial solid waste pollution, consumption of non-renewables and cost of crime are estimated as the province-level data multiplied by the ratio of city GDP to province GDP; (3) Defensive private expenditure on health and education per capita and Private expenditure on commuting per capita are estimated as the province-level data multiplied by the ratio of city average wage to province average wage; (4) Cost of natural disasters and Services from public infrastructure are estimated as province-level data per capita multiplied by the city’s population. 
As for the partially missing items, the imputations include: (1) Missing values of population are estimated by linear interpolation; (2) Missing values of urban population are calculated as urbanization rate multiplied by total population, where missing urbanization rates are estimated following the trend (growth rate) of province-level urbanization rate; (3) The missing data on the change of wetland size is estimated as the province-level change of wetland size multiplied by the share of the city wetland size in provincial wetland size; (4) For cities that have no single forest size data available, the change of forest size is estimated as the province-level change of forest size multiplied by the share of the city’s land size in the provincial land size. For cities that has one year data available, the multiplier is always the share of the city’s forest size in the provincial forest size in that year; (5) Missing values of other items are estimated based on the growth rate of the corresponding province-level data.

