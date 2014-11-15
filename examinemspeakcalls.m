iAA=14;
myMasses=[12,1.007825,14.0031,15.9949,27.9769,31.9721];
for iFrags=1:length(Experiments.data.ff.A(iAA).frag.formula)
figure
    myAtoms=Experiments.data.ff.A(iAA).frag.formula(iFrags).b ...
        + Experiments.data.ff.A(iAA).frag.formula(iFrags).d;
    curMass=sum(myAtoms.*myMasses);
    nIsotopes=Experiments.data.ff.A(iAA).frag.formula(iFrags).b(1)+3;
    nIsotopes=4;
    for iMZ=Experiments.data.ff.spectra(iAA,iFrags).scans'
        myPos=Experiments.data.data.mz.mz(iMZ,:)>curMass-4 & ...
            Experiments.data.data.mz.mz(iMZ,:)<curMass+nIsotopes;
        plot(Experiments.data.data.mz.mz(iMZ,myPos),...
            Experiments.data.data.mz.intensity(iMZ,myPos),'-O','MarkerSize',15)
        hold all
    end
    for iIsotope=1:nIsotopes
        rectangle('Position',[sum(curMass)-.22+iIsotope-1,0,.44,max(ylim)]);
    end
end