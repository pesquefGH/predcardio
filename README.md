# predcardio
Repository of data and scripts (matlab) to reproduce the results of the paper "Prediction of the monthly number of cardiovascular hospital admissions in the Brazilian public- health system using PATV decomposition and SARIMA model"

TITLE:\
"Prediction of the monthly number of cardiovascular hospital admissions in the Brazilian public- health system using PATV decomposition and SARIMA model"


Authors: \
Paulo A. A. Esquef\
Paulo Cabral Filho\
Cid M. de M. Vianna\

Contact: Paulo Esquef:  pesquef at lncc.br 

ABSTRACT:\
Using publicly available data from the public health system (SUS) database in Brazil, we tackle the
problem of forecasting the monthly per capita number of hospital admissions (HA) by cardiovascular
diseases (CVD), from January 2024 to December 2025, based on data from January 2012 to December
2023. To deal with the sudden sag in HA during the COVID-19 pandemic period, we propose using a
signal decomposition tool called Polynomial Approximation Total Variation (PATV), which is capable
of isolating three components: the sag in HA, a polynomial trend, and a seasonal component. Then, for
each component separately, we run appropriate methods to obtain associated 24-month predictions,
before summing up the results into a combined forecast. More specifically, we use a SARIMA model
to predict the seasonal component and polynomial extrapolation for the other two components. We
report the mean forecast and the 95% prediction interval. Regarding the prediction performance, the
mean relative error (MRE) between the median forecast and the actual number of HA is approximately
2.1%, demonstrating the accuracy of the proposed method. Finally, we train the prediction model with
data from January 2012 to December 2025 to provide a mean forecast from January 2026 to December
2027, with a respective 95% prediction interval.

\
DATA

Raw or original time series (TS) of the monthly CVD-related procedures in SUS hospital admissions, from  January 2012 to December 2025. Sequence y_o(n) in the paper:



.csv file

.mat file (use 'save link as' to download)

List of Hospital Admission (Procedure) Authorization Codes and associated descriptions (.xlsx file).

Adjusted (per million inhabitants) time series of the monthly HA in SUS by CVD, from  January 2012 to December 2025. Sequence y(n) in the paper:

.csv file

.mat file  (use 'save link as' to download)


MATLAB SCRITPS TO REPRODUCE THE RESULTS REPORTED IN THE PAPER


Script to perform data adjustment from raw (absolute values) to  per million  inhabitants, considering a growth population model

Reference Implementation of the proposed Predictor and related demonstration use (.zip: script and data)
     
Performance Evaluation of the proposed Predictor:

Figures:

Script to generate Figures 2 to 4 of the paper (forecast 2024 - 2025) (.zip: script and data)

Script  to generate Figure 5 of the paper  (parameter sensitivity analysis - optimal prediction performance, from map MRE(lambda,p))

Script in Matlab to generate Figure 6 of the paper (forecast 2026 - 2027)  (.zip: script and data)

Script to generate the results shown in Table 2 of the paper  (.zip: script and data)

Script to generate the results shown in Table 3 of the paper (.zip: scritpt and data)

Script to run the optimal MRE  performance comparsion between the proposed PATV+SARIMA and the competing SARIMA-only  predictors (.zip: script and data)

Estimate of the deficit in HA by CVD in the first 15 months of the COVID-19 pandemic

Script to generate the result reported in the paper  (.zip: script and data)



ANNEX


List of Hospital Admission (Main Procedure) Authorization Codes and  associated descriptions (.xlsx file).

