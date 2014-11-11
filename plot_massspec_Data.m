% dataFolderName='/Users/michaelspringer/Dropbox/C13_data/140616_Springer/';
% dataFolderName='/Users/michaelspringer/Dropbox/C13_data/140616_Springer/GoodSamples/';
% dataFolderName='/Users/michaelspringer/Desktop/';
% dataFolderName='/Users/RenanEscalante/Dropbox/C13 data/140616_Springer/';
dataFolderName='C13 data/140530/';
myFiles=dir([dataFolderName,'*.ff']);
clear meanOutput stdOutput nameOutput
%iterate through all the files and extract data
for iFile=1:length(myFiles)
    curFile=myFiles(iFile).name;
    %grab the data and stick in to DATA structure
    DATA=readFF(curFile,dataFolderName);
    %make a good file name
    folderName='/Users/michaelspringer/Desktop';
    fileName=DATA.file.ff.name;
    fileName=strrep(fileName,'.','_');
    %On the first time through create the goodData struct
    if ~exist('goodData')
        for iAA=1:length(DATA.ff.A);
            try
                goodData(iAA,:)=DATA.ff.A(iAA).frag.autoweight;
            catch
                goodData(iAA,:)=[DATA.ff.A(iAA).frag.autoweight,0];
            end
        end
        goodData=goodData>0;
    end
    
    %Output all the ratios
    %xlswrite([folderName,'/',fileName(2:end)],DATA.ff.fl,1,'B1');
    %output the good ratios processed
    DATA.ff.fl(goodData==0)=nan;
    DATA.ff.fl(8,:)=[];
    meanOutput(:,iFile)=nanmean(DATA.ff.fl,2);
    stdOutput(:,iFile)=nanstd(DATA.ff.fl,[],2);
    namePos=(findstr(fileName,'_'));
    sampleName=str2num(fileName(namePos(1)+1:namePos(2)-1));
    nameOutput(iFile)=sampleName;
    %xlswrite([folderName,'/',fileName(2:end)],DATA.ff.fl,1,'B1');
 
end
 
