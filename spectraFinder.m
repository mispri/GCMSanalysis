function spectraMS=spectraFinder(mzData,iAA,iFrags,D)

myMasses=[12,1.007825,14.0031,15.9949,27.9769,31.9721];
myAtoms=D.ff.A(iAA).frag.formula(iFrags).b ...
    + D.ff.A(iAA).frag.formula(iFrags).d;
curMass=sum(myAtoms.*myMasses);
nIsotopes=14.3; %for consistancy with fiat flux

scansToExtract=D.ff.maxima(iAA,1):D.ff.maxima(iAA,2);
subMzData=mzData.mz(scansToExtract,:);
subIntensityData=mzData.intensity(scansToExtract,:);
spectraMS=zeros(size(subIntensityData,1),16);
for iIsotope=1:16
    for iScan=1:size(subIntensityData,1)
        
        mzToExtract=subMzData(iScan,:)>curMass-2.3+iIsotope & ...
            subMzData(iScan,:)<curMass-1.7+iIsotope;
        try
            spectraMS(iScan,iIsotope)=subIntensityData(iScan,mzToExtract);
        catch
            iScan;
            iIsotope+curMass;
            iScan;
        end
    end
end