if ~exist('NAMECONVERSION')
    load(NAMECONVERSION);
end
iAA=14;
for iFrag=1:5;
    try
        figure,loglog(Experiments(1).data.ff.spectraMS(iAA, iFrag).blsum,Experiments(1).data.ff.spectraMS(iAA, iFrag).blsumMzCorrected,'.')
        hold all
        xlabel('blsum')
        ylabel('mz corrected')
        plot(xlim,xlim)
    end
end