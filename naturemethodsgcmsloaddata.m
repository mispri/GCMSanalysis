%% %c13samples
pathNames='/Users/michaelspringer/Documents/MATLAB/FiatFlux Mike mod/FIatflux/Christine GCMS/';
fileNames={'CD11071440.ff','CD11071441.ff','CD11071442.ff'};
c13Experiment=plotMSdata(fileNames,pathNames);
%% %c12samples
pathNames='/Users/michaelspringer/Documents/MATLAB/FiatFlux Mike mod/FIatflux/Christine GCMS/';
fileNames={'CD11101403.ff','CD11101415.ff','CD11101416.ff','CD11101417.ff','CD11101418.ff','CD11101419.ff','CD11101420.ff','CD11101427.ff','CD11101428.ff','CD11101429.ff','CD11101452.ff','CD11101459.ff','CD11101466.ff','CD11071418.ff','CD11071426.ff','CD11071433.ff'};
c12Experiment=plotMSdata(fileNames,pathNames);
%% %grow then mix
pathNames='/Users/michaelspringer/Documents/MATLAB/FiatFlux Mike mod/FIatflux/Christine GCMS/';
fileNames={'CD11071423.ff','CD11071429.ff','CD11101462.ff'};
cGrowThenMix=plotMSdata(fileNames,pathNames);
%% %mix then grow
pathNames='/Users/michaelspringer/Documents/MATLAB/FiatFlux Mike mod/FIatflux/Christine GCMS/';
fileNames={'CD11101455.ff','CD11101469.ff','CD11071436.ff'};
cMixThenGrow=plotMSdata(fileNames,pathNames);
