% Marcus Bowyer
% Computation of uncertainty for Gaussian peak
clear all;

% data table with columns z,a,b,c,d,n (z only for ID)
% a,b,c,d fit Gaussian a*exp(-((x-b)/c).^2*log(2))+d
data = [22,89.435413,0.700699,0.015093,5.0,14;
    24,98.901812,0.834223,0.018483,0.826667,15;
    26,100.256503,0.980206,0.019824,2.222222,14;
    28,97.893482,1.142910,0.017791,1.111111,17;
    29,97.221387,1.227235,0.016793,2.222222,14
    32,102.802008,1.501378,0.019382,2.219702,14;
    42,95.809679,2.631017,0.022924,2.222222,14;
    47,90.946741,3.327186,0.028786,1.388222,20];

x = linspace(0,7.9,1000); %voltages from 0 to 7.9
f = @(x,a,b,c,d) a*exp(-((x-b)/c).^2*log(2))+d; %Gaussian fit
y = zeros(8,1000); % initialize counts matrix
sigma = zeros(1,8); % initialize zigma matrix
error = zeros(1,8); % initialize error matrix
for i = 1:8
    % compute y values
    y(i,:) = f(x,data(i,2),data(i,3),data(i,4),data(i,5));
    % compute sigma from full width half maximum
    sigma(1,i) = fwhm(x',y(i,:)')/2.355;
    % find uncertainty = sigma/sqrt(N)
    error(1,i) = sigma(1,i)/sqrt(data(i,6));
end