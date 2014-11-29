function Experiments=calculate13cfraction(Experiments)
output=[];
for iExp=1:length(Experiments)
    %  for iAA=[2,9,10,12,14,15]
    %      for iFrag=5
    for iAA=1:15
        for iFrag=1:5
            try
                if Experiments(iExp).data.ff.A(iAA).frag.autoweight(iFrag)
                data=Experiments(iExp).data.ff.mdva(iAA, iFrag).corr_nat_iso;
                c13fract=data*(0:length(data)-1)'/(length(data)-1);
                output(end+1)=c13fract;
                Experiments(iExp).data.ff.mdva(iAA,iFrag).c13fraction=c13fract;
                end
            end
        end
    end
    Experiments(iExp).data.ff.c13fract=median(output);
end

