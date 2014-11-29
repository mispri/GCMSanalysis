if ~exist('NAMECONVERSION')
    load('/Users/michaelspringer/Documents/MATLAB/FiatFlux Mike mod/FIatflux/Christine GCMS/nameconversionGCMS.mat')
end
Experiments=c13Experiments;
%Experiments=cGrowThenMix;
%Experiments=cMixThenGrow;
%Experiments=c12Experiments;

iAA=13;
for iFrag=1:5;
    if Experiments(1).data.ff.A(iAA).frag.good(iFrag)==1
        try
            a=[];
            names={};
            nIsotopes=length(Experiments(1).data.ff.mdva(iAA, iFrag).CONHSiS);
            for i=1:length(Experiments)
                %a(i,:)=Experiments(i).data.ff.mdva(iAA, iFrag).raw;
                %            a(i,:)=Experiments(i).data.ff.spectraMS(iAA, iFrag).noSatSum(2:1+nIsotopes);
                %a(i,:)=Experiments(i).data.ff.mdva(iAA, iFrag).corr_nat_iso;
                a(i,:)=Experiments(i).data.ff.mdva(iAA, iFrag).actualdist;
                %a(i,:)=a(i,:)./max(a(i,:));
                tmpName=Experiments(i).data.file.ff.name;
                tmpName=NAMECONVERSION(strcmpi(NAMECONVERSION(:,1),tmpName),3);
                if iscell(tmpName)
                    names(i)=tmpName;
                else
                    names{i}=tmpName;
                end
                if isnumeric(names{i})
                    names{i}=num2str(names{i});
                end
            end
            try
                a(end+1,:)=Experiments(i).data.ff.mdva(iAA, iFrag).CONHSiS;
                names{end+1}='Theory';
            end
            figure,bar(a')
            myTitle=[Experiments(1).data.ff.A(iAA).name,' fragment ',num2str(iFrag),' ',cell2mat(Experiments(1).data.ff.A(iAA).frag.names(iFrag))];
            title(myTitle);
            legend(names)
            %set(gca,'XTickLabel',names)
        end
    end
end