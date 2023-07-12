
% caseID MW12 / CLASE008
startS = [1  15 31 47 63 79 95 109 123 137 145 157 167 183 199];
NumCs =  [14 16 16 16 16 16 14 14  14  8   12  10  16  16  8];
locations = {'LAH','LPH','LMP','ROF','RAC','RPOL','RAMY','RAH',...
    'RPH','RAI','RPI','RBAS','RMP','RPC','LAMY'};

outMod = convertSEEGlabelsFN(startS, NumCs, locations, toMod);