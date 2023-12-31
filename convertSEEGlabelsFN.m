function [outMod] = convertSEEGlabelsFN(startS , NumCs, locations, toMod)

% startS = [1 13 23 35 50 62 74 82 90 105 120 132 144];
% % stopS = []
% NumCs = [12 10 12 15 12 12 8 8 15 15 12 12 15];
% locations = {'LAMY','LAH','LPH','LIT','LOF','LAC','LAI','LPI','LPC',...
%     'LMP','RAMY','RAH','RPH'};

inMod = toMod;
outMod = inMod;

coloRRs = [255 53 94 ;
           253 91 120;
           255 96 55;
           255 153 102;
           255 153 51;
           255 204 51;
           255 255 102;
           204 255 0;
           102 255 102;
           170 240 209;
           22 208 203;
           80 191 230;
           156 39 176;
           238 52 210;
           255 0 204;
           39, 125, 161;
           87, 117, 144;
           67, 170, 139];

coloRRs2 = coloRRs/255;

% CHANGE TYPE TO SEEG

for ci = 1:length(NumCs)

    start = startS(ci);
    numC = NumCs(ci);
    stop = (start + numC - 1);
    location = locations{ci};

    count = 1;
    for i = start:stop

        outMod.Channel(i).Name = [location,num2str(count)];

        count = count + 1;
    end




    for i = start:stop

        outMod.Channel(i).Group = location;

    end


    for i = start:stop
        outMod.Channel(i).Color = coloRRs2(ci,:);
    end

    for i = start:stop
        outMod.Channel(i).Type = 'SEEG';
    end


    for i = start:stop

        outMod.Channel(i).Loc = [0.0 ; 0.0 ; 0.0];

    end

end

%%

stTemp = struct2table(outMod.Channel);

stTemp2 = stTemp(1:sum(NumCs),:);

strcTab = table2struct(stTemp2);

outMod.Channel = strcTab;

%% 
outMod.IntraElectrodes.Color = [];
for ti = 1:length(NumCs)

    outMod.IntraElectrodes(ti).Name = locations{ti};
    outMod.IntraElectrodes(ti).Model = [];
    outMod.IntraElectrodes(ti).Loc = [];
    outMod.IntraElectrodes(ti).ContactNumber = NumCs(ti);
    outMod.IntraElectrodes(ti).ContactSpacing = [];
    outMod.IntraElectrodes(ti).ContactDiameter = 8.000000000000000e-04;
    outMod.IntraElectrodes(ti).ContactLength = 0.002000000000000;
    outMod.IntraElectrodes(ti).ElecDiameter = 7.000000000000000e-04;
    outMod.IntraElectrodes(ti).ElecLength = 0.070000000000000;
    outMod.IntraElectrodes(ti).Color = coloRRs2(ti,:);

end

%%


elTemp = struct2table(outMod.IntraElectrodes);

elTemp2 = elTemp(1:length(NumCs),:);

eleStrTab = table2struct(elTemp2);

outMod.IntraElectrodes = eleStrTab;


end


