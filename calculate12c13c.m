function Experiments=calculate12c13c(Experiments,isotopeDistributions)
if ~exist('isotopeDistributions')
    isotopeDistributions=calculateexpecteddistributions(Experiments(1).data.ff.A);
end

for iExp=1:length(Experiments);
    for iAA=1:length(Experiments(iExp).data.ff.A)
        for iFrag=1:length(Experiments(iExp).data.ff.A(iAA).frag.names)
            data=Experiments(iExp).data.ff.mdva(iAA, iFrag).corr_nat_iso;
            dist=isotopeDistributions.A(iAA).frag(iFrag).distribution;
            x=fmincon(@(x) determineCarbons(x,data,dist),[1,zeros(1,length(data)-2)],-eye(length(data)-1),zeros(length(data)-1,1));
            x(end+1)=1-sum(x);
            Experiments(iExp).data.ff.mdva(iAA,iFrag).actualdist=x;
        end
    end
end

