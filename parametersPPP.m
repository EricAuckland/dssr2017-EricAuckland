function [paraElectrodes, paraTriggers, delaySize, paraMinEpoch, paraMaxEpoch] = parametersPPP()

% OUTPUTS:      paraElectrodes = electrodes of interest
%               paraTriggers = triggers to epoch around
%               delaySize = the delay associated with EGI amplifiers and the stimulus delay.
%               paraMinEpoch = epoch start
%               paraMaxEpoch = epoch end

% Parameter questions
prompt={'What electrode/s do you desire (e.g. 58):','Name triggers to epoch around (e.g. Dist1):','What is the trigger latency and amplifier lag (ms)?:','Epoch start (ms):','Epoch end (ms):'};
title='ParametersPPP'; 

% The answers are converted to variables and usable types
answer=inputdlg(prompt,title);
paraElectrodes = str2num(answer{1}); 
paraTriggers = (answer{2});
delaySize = str2num(answer{3});
paraMinEpoch = str2num(answer{4});
paraMaxEpoch = str2num(answer{5});
end