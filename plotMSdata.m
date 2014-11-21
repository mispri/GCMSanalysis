[fileNames,pathName] = uigetfile('*.*','Select the ff file','MultiSelect', 'on');
if ~iscell(fileNames)
    fileNames={fileNames};
end
Experiments={};
for cFileName=fileNames
    cFileName=cell2mat(cFileName);
    Experiments(end+1).data=readFF(cFileName,pathName);
end
%Calculate the actual 12C and 13C levels
Experiments=calculate12c13c(Experiments,isotopeDistributions);
%Determine how much 12C and 13C is in each sample
[Experiments]=calculate13cfraction(Experiments);

%%
h=figure('Name',cFileName);
set(h,'units','normalized','Position',[0,0,1,1]);
count=0;
allAA=1:15;
nAA=length(allAA);
for iAA=allAA
    for iFrag=2:5
        count=count+1;
        subplot(nAA,4,count)
        tmp=[];
        for iExp=1:length(Experiments)
            try
                tmp(end+1,:)=Experiments(iExp).data.ff.mdva(iAA,iFrag).raw;
 %               tmp(end+1,:)=Experiments(iExp).data.ff.mdva(iAA,iFrag).corr_nat_iso;
            end
        end
        try
            bar(tmp');
        end
        if mod(count,4)==1
            ylabel(Experiments(iExp).data.ff.A(iAA).name(1:3));
        end
    end
end
subplot(nAA,4,[nAA*4-3:nAA*4]);
bar(ones(length(fileNames),1));
legend(fileNames)
