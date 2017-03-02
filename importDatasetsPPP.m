function [ALLEEG, EEG, CURRENTSET, numberOfDatasets] = importDatasetsPPP(pathName, fileNames, ALLEEG, EEG, CURRENTSET)

% OUTPUTS:      ALLEEG = the EEG struture produced by EEGLAB
%               EEG = where EEGLAB stores data
%               CURRENTSET = the current dataset being used
%               numberOfDatasets = number of datasets stored
%
% INPUTS:       fileNames = names of the files
%               pathNames = the path of where the files ares

% detects number of datasets
if isstr(fileNames) 
    numberOfDatasets = 1
else numberOfDatasets = size(fileNames,2)
end

% imports files
for i = 1:numberOfDatasets;
    EEG = pop_readegi((strcat(pathName, fileNames{1,i})), [],[],'auto');
    [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, i,'gui','off');
end;

% merges datasets into one files and removes excess from memory
EEG = pop_mergeset( ALLEEG, [1:numberOfDatasets], 0);
[ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
[ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 1);
eeglab redraw;
ALLEEG = pop_delset( ALLEEG, [2:numberOfDatasets] );

