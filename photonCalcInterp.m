function [out] = photonCalcInterp(calFileLoc, wavelength, voltages, ND, labelStr)
    % Load the calibration data
    load(calFileLoc);
    
    % Select the part of the struct that contains the wavelength
    idx = [result.wavelength] == wavelength;
    thisStruct = result(idx);
    if nargin >= 5
        try
            idx = [thisStruct.monitorDevice] == labelStr;
            thisStruct = thisStruct(idx);
        catch
            error('No matching label found in calibration file. Check for mismatch between calibration monitorDevice and function input labelStr.');
        end
    elseif nargin < 5 && length(thisStruct) > 1
        warning('Warning: More than one LED found. Specify desired LED with labelStr. Defaulting to first LED in calibration file.')
        thisStruct = thisStruct(1);
    else
    end

    % Extract calibration parameters
    p = thisStruct.photonDensity;
    v = thisStruct.stimVoltage;

    % Interpolate
    intPhotons = interp1(v, p, voltages);

    % Attenuate
    intPhotons_att = intPhotons .* 10^-ND;

    out = intPhotons_att;

end