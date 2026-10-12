%% Compare Stellar Spectra
% Computes the radial velocity of 7 stars from the Doppler shift of the
% hydrogen H-alpha line, then plots all spectra together.
% Blueshifted stars (moving toward us) are drawn dashed; redshifted stars
% (moving away) are drawn with a thick line.
%
% Data: starData.mat (provided by MATLAB Onramp, not included in this repo)

%% Load data
load starData

%% Compute speed of every star
[sHa,idx] = min(spectra);          % absorption dip of each star
lambdaHa = lambda(idx);            % observed H-alpha wavelength
z = lambdaHa/656.28 - 1;           % redshift
speed = z*299792.458;              % km/s (negative = toward us)

%% Plot all spectra
figure
hold on
for v = 1:7
    s = spectra(:,v);
    if speed(v) <= 0
        plot(lambda,s,"--")                 % blueshift: moving toward us
    else
        plot(lambda,s,LineWidth=3)          % redshift: moving away
    end
end
hold off
xlabel("Wavelength (nm)")
ylabel("Intensity")
title("Stellar Spectra: Redshift vs. Blueshift")
legend(starnames)

%% Stars moving away from Earth
movaway = starnames(speed > 0)
