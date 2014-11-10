function DATA = parinitializeLoop(curFile,dataFolderName)
%take an AA run and find the correct position of all the peaks

%Open the AA Standard
%grab the data and stick in to DATA structure
DATA=readFF(curFile,dataFolderName);


%Start with a good diagnostic Amino Acid
%Good test are 12, 13, and 10
myTestAA=12;
y=correctaa(DATA,myTestAA,'Serine');

%now compare this to the default offset and correct
offset=y-round(mean(DATA.ff.A(myTestAA).range));
for iAA=1:length(DATA.ff.A)
    DATA.ff.A(iAA).range=DATA.ff.A(iAA).range+offset;
end

%Go through each amino acid and verify the correction
for iAA=1:length(DATA.ff.A)
    offset=correctaa(DATA,iAA);
    if offset<0
        break
    end
    newPos=DATA.ff.A(iAA).range+offset;
    %make sure the offset is still in the allowable range
    newPos=max(newPos,26);
    newPos=min(newPos,size(DATA.data,1)-25);
    DATA.ff.A(iAA).range=newPos;
end

function y=correctaa(DATA,nAA,aaName)
if nargin==3
    h=viewsingleaa(DATA,nAA,aaName);
    startYLim=ylim;
    [x,y]=ginput(1);%select a range
        ylim([max(1,y-25),min(max(startYLim),y+25)]);
else
    h=viewsingleaa(DATA,nAA);
    startYLim=ylim;
    ylim(DATA.ff.A(nAA).range);
    y=0;
end
happy=false;
while ~happy
    if nargin==2
    choice = MFquestdlg([0,0],'Are you happy with this zoom?', ...
        'Amino Acid Selecion Region', ...
        'Yes','No','Yes to all','Yes');
    else
    choice = MFquestdlg([0,0],'Are you happy with this zoom?', ...
        'Amino Acid Selecion Region', ...
        'Yes','No','Yes');        
    end
    switch choice
        case 'Yes'
            happy=true;
            close(h); %close the figure
        case 'No'
            ylim(startYLim);
            [x,y]=ginput(1); %allow one to select a new range
    ylim([max(1,y-25),min(max(startYLim),y+25)]);
        case 'Yes to all'
            happy=true;
            close(h); %close the figure
            y=-1;
    end
end
y=round(y);%make y an integer before returning
