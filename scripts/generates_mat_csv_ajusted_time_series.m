% Script to generate the files .mat and .csv for the raw time series
% of monthly hospital admissions in SUS due to all registered 
% cardiovascular diseases,
% from January 2012 to December 2025

% Paulo Esquef, July 2026

clear all
close all
clc

% Raw time series (harvested from dataSUS)

y_o = [62302	61514	64241	62062	63318	62592	63800	65498 ... 
    62131	63336	61045	56564	59755	57363	59389	61075 ...
    61659	60248	63073	64879	63923	64945	62302	58992 ...
    59834	57958	57342	58671	62059	60422	64431	65022 ...
    63886	63427	60920	57132	57755	56127	59585	58594 ...
    59215	60894	63894	63882	62285	61646	60409	57176 ...
    57454	56284	59145	56759	57379	60383	61936	63541 ...
    61111	61406	59174	58267	58299	55870	58977	55805 ...
    60631	58262	61027	63694	62048	60371	59759	57936 ...
    58959	55708	59488	57997	58271	58548	60943	63372 ...
    61126	61640	59033	57353	59794	56701	58336	58732 ...
    60721	58617	63618	66954	64254	64251	60971	60368 ...
    61243	59222	57444	47316	47534	47384	49649	51863 ...
    51129	54096	53455	49521	48738	48233	46466	43251 ...
    46087	48891	54399	58921	59857	59393	59601	59982 ...
    56967	53731	58267	58017	61290	59793	63698	65860 ...
    66056	66271	63146	63178	63418	59496	63728	59852 ...
    62059	64694	67162	69199	65445	64713	62034	62560 ...
    64667	61753	62795	63245	62786	64624	68680	70239 ...
    69256	68319	65475	64255	68740	64425	66840	65919 ...
    69159	68043	72478	74517	73889	73001	68897	68360]';

% y_o is a column vector with 168 raw data values

% The script below uses a population growth model to
% adjust the raw time series, i.e., to compensate the absolute 
% number of hospital admissions for the population 
% growth in the investigated period. 

% Growth population model

P_2010=190755799;  % Brazilian population in December/2010 
% (by IBGE, official census agency) 

P_2022=203080756;  % Brazilian population in December/2022 (by IBGE)

% Population growth model (simple exponential model): 

% P(k)= P_2010*(1+r)^(k-1);  % with k given in months 

% P(k) is the estimated population at a given month k
% r is the monthly growth rate (constant over time)

% Below, k is the time index

% k=1 refers to Dec./10 
% k=2 refers to Jan./11
% k=13 refers to Dec. /11
% k=14 refers to Jan. /12
% ...
% k=145 refers to Dec./22

% Calculus of r in the period from 2010 and 2022. 
% We assume r remains the same up to Dec./2025

T=145-1; % number of data points (months) from P_2010 to P_2022.

r=exp((log(P_2022/P_2010))/T)-1;  %  monthly growth rate
% Observation: r*12 is the annual growth rate

% Growth Model Verification
k=1;
Pk=P_2010*(1+r).^(k-1);
[P_2010 Pk]  % these values must be equal

k=145;
Pk=P_2010*(1+r).^(k-1);
[P_2022 Pk] % these values must be equal


% The raw time series is y_o(n), with time basis n such that

% n=1 refers to Jan./12
% ...
% n=12 refers to Dec./12
% n=13 refers to Jan./13
% ...
% n=168 refers to Dec./25

n=(1:168)'; % time range of y_o(n);


% For the growth model p(k), the time range from Jan./12 to Dec.25,
% in k is given by 

rg_k=n+13; 

p=P_2010*(1+r).^(rg_k-1); % curve of monthly population growth 
% from Jan./12 to Dec.25

% Adjusted time series y(n) = y_0(n)/p(n) * 1e6

y = 1e6.*y_o./p;  % adjusted time series

save adjusted_time_series y

year_range=(2012:2025)';
year=kron(year_range,ones(12,1)); 

n=(1:length(y_o))'-1;   % 
month=mod(n,12)+1;   % month in the range

T = table(year,month,y_o);

writetable(T,'adjusted_time_series.csv','Delimiter',',')

