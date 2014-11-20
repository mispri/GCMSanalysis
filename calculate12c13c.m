function Experiments=calculate12c13c(Experiments,isotopeDistributions)
if ~exist('isotopeDistributions')
    isotopeDistributions=calculateexpecteddistributions(Experiments(1).data.ff.A);
end

data=Experiments(2).data.ff.mdva(1, 3).corr_nat_iso;
dist=isotopeDistributions.A(1).frag(3).distribution;
x=fmincon(@(x) determineCarbons(x,data,dist),[1,zeros(1,length(data)-2)],-eye(length(data)-1),zeros(length(data)-1,1));
x(end+1)=1-sum(x);

