function [] = createBadChanDataOPCSEA(patID , dataLOC)


cd(dataLOC)

% load in nwb
nwbDir1 = dir('*.nwb');
nwbDir2 = {nwbDir1.name};
nwbDir3 = nwbDir2{1};
nwbFile = nwbRead(nwbDir3);

% save 1 minute block
lfpdata = nwbFile.processing.get('ecephys').nwbdatainterface.get...
    ('LFP').electricalseries.get('MacroWireSeries').data(:,1:500*60);

% save out as mat file
saveName = ['FilteredLFP_',patID,'.mat'];
save(saveName , "lfpdata");