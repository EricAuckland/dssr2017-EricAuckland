function [EEG, splitParaTriggers] = epochPPP(EEG, paraMinEpoch, paraMaxEpoch, paraTriggers)

% OUTPUTS:      EEG = where EEGLAB stores data
%               splitParaTriggers = splits the triggers into usable types
%
% INPUTS:       paraMinEpoch = epoch start
%               paraMaxEpoch = epoch end
%               paraTriggers = triggers to epoch around

% Converts trigger values to a string and splits unique triggers
splitParaTriggers = strsplit(paraTriggers,' ')

% Epochs the data around triggers and epoch values
EEG = pop_epoch( EEG, (splitParaTriggers), [(paraMinEpoch/1000), (paraMaxEpoch/1000)], 'newname', paraTriggers, 'epochinfo', 'yes');

end