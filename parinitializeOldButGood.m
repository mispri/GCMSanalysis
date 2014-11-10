function varargout = parinitialize
%take an AA run and find the correct position of all the peaks

%interactivelly open up the AA standard
[fileNameAASTD,dataFolderName,filterIndex]=uigetfile('*.ff');

%Open the AA Standard
%grab the data and stick in to DATA structure
DATA=readFF(fileNameAASTD,dataFolderName);


%Start with a good diagnostic Amino Acid
%Good test are 12, 13, and 10

h=viewsingleaa(DATA,12,'Serine');
startYLim=ylim;
happy=false;
while ~happy
    [x,y]=ginput(2);
    ylim(sort([y(1),y(2)]));
    
    choice = questdlg('Are you happy with this zoom?', ...
        'Amino Acid Selecion Region', ...
        'Yes','Unzoom','Zoom More','Yes');
    switch choice
        case 'Yes'
            happy=true;
        case 'Unzoom'
            ylim(startYLim);
    end
end



%Go through each amino acid
%this is a test at the beginning to find the amino acids on a first run
for iAA=1:length(DATA.ff.A)
    viewsingleaa(DATA,iAA);
end

