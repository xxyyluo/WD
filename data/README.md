# A new index reveals declining welfare diversity in China
*Xi Ji, Xianling Long, Guowei Wu, Pinyi Su, Xuanyuan Luo, and Robert Costanza*

Data for the manuscript "A new index reveals declining welfare diversity in China".

Data lists: 

(1) 2021.8.6_provincialGPI_compenent_and_measurement.xlsx : raw data for the measurement of provincial GPI compenents (the calculating results of GPI, WD and SGPI are already presented in our paper[^1]);

(2) data_province.dta : data used for the regression models (province level);

(3) 2022.3.2_prefecturalGPI_component_and_measurement.xlsx : raw data for the measurement of prefectural GPI compenents[^2];

(4) data_prefecture.dta : data used for the regression models (prefecture level);

For replication issues, please feel free to contact us at jixi@pku.edu.cn (Xi Ji).


[^1]: The base map of China (for Fig. 2) is obtained from https://github.com/r-stata/stata-prov-map.

[^2]: Since data quality is really bad before 2007, we finally curtail the research period to 12 years (2007 to 2018) for prefecture-level analysis to ensure the integrity and validity of the data. Even for 2007-2018, many welfare components are still missing. We impute the completely missing data based on provincial data as reasonable as we can. The imputation includes: (1) A prefecture’s consumer durables expenditure per capita and time use of labor (time spending on leisure, domestic labor, volunteer work and etc.) are set to the provincial average level; (2) Personal consumption expenditures, cost of industrial solid waste pollution, consumption of non-renewables (thus long-term environmental damage and depletion of non-renewables) and cost of crime are estimated as the province-level data scaled by the ratio of prefecture/province GDP; (3) For defensive private expenditure on health and education per capita and private expenditure on commuting per capita, we scale the province-level data by the ratio of prefecture/province average wage; (4) For cost of natural disasters and services from public infrastructure, we use the per capita province-level data scaled by the prefecture’s population; As for the partially missing items, the imputation includes: (5) Missing values of resident population are estimated by linear interpolation; (6) Missing values of urban resident population are calculated in terms of urbanization rate (multiplied by resident population) whose missing values are estimated following the trend (growth rate) of province-level urbanization rate; (7) Since data of wetland area is only one year available, the change of wetland area is estimated by the share of prefecture’s wetland area in the province’s wetland area that year (multiplied by the province-level change of wetland area); (8) Missing values of forest area are mainly estimated by linear interpolation; For the prefecture that has no forest area data available, the change of forest area is estimated by the share of prefecture’s land area in the province’s land area (multiplied by the province-level change of forest area), while for the prefecture that has one year data available, this item is estimated by the share of prefecture’s forest area that year; (9) Missing values of other items are estimated following the trend (growth rate) of province-level items.
