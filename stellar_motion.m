%% Stellar Motion Project
% Estimates a star's velocity from the Doppler shift of its hydrogen
% absorption line (H-alpha, rest wavelength 656.28 nm).
%
% Data: starData.mat (provided by MATLAB Onramp, not included in this repo)

%% Load data and measurement parameters
load starData
nObs = size(spectra,1);     % number of observations
lambdaStart = 630.02;       % starting wavelength (nm)
lambdaDelta = 0.14;         % wavelength spacing (nm)

%% Build the wavelength vector
lambdaEnd = lambdaStart + (nObs - 1) * lambdaDelta;
lambda = lambdaStart:lambdaDelta:lambdaEnd;

%% Plot the spectrum of one star
s = spectra(:,6);
plot(lambda,s,".-")
xlabel("Wavelength (nm)")
ylabel("Intensity")
title("Stellar Spectrum")

%% Find the hydrogen absorption dip
[sHa,idx] = min(s);
lambdaHa = lambda(idx);

%% Mark the dip on the plot
hold on
plot(lambdaHa,sHa,"rs",MarkerSize=8)
hold off

%% Compute redshift and speed
z = (lambdaHa / 656.28) - 1;
speed = z * 299792.458;     % km/s (positive = moving away)

fprintf("Observed H-alpha wavelength: %.2f nm\n", lambdaHa)
fprintf("Redshift z = %.5f\n", z)
fprintf("Star speed = %.1f km/s\n", speed)
