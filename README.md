A photon calculation function written for MATLAB that is used to find the photon values at a given set of input voltages.

Inputs needed are:

calFileLoc - A string containing the location of your calibration file, used for loading in your calibration (ie. "C:\Users\Person\DownloadssampleCalibrationFile_05Mar2026.mat")

wavelength - A number that is the wavelength of the LED you want to find the photons for (in nm)

voltages - A single number or a 1D array that contains the input voltages that are set in Symphony and sent to the LED

ND - The value of your neutral density filter if applicable

labelStr - An optional character array input that helps filter out which LED to use if there is more than one of the same wavelength (ie 'LED Side')

A sample calibration file has been included to demonstrate the format needed for the function to work properly.

Code is set to default to the first LED found in the calibration file if more than one of the same wavelength are detected but no device is specified (see labelStr above).
