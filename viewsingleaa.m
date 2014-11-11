function h=viewsingleaa(DATA,iAA,myFlag)
%if the flag is defined it runs the full y range

%Figure out the likely targets
%grab the expected xaxis range
xRange=min(DATA.ff.A(iAA).frag.mz)-10:...
    max(DATA.ff.A(iAA).frag.mz)+10;

%plot the data
h=figure('name',DATA.ff.A(iAA).name)
imagesc(DATA.data.raw)
hold all

%for each potential fragment, plot in r if it seems good and y if not based on autoweight
for iFrag=1:length(DATA.ff.A(iAA).frag.mz);
    nFrag=DATA.ff.A(iAA).frag.mz(iFrag);
    if DATA.ff.A(iAA).frag.autoweight(iFrag)
        plot([nFrag,nFrag],ylim,'r--')
    else
        plot([nFrag,nFrag],ylim,'y--')
    end
end
%now plot the expect y range
plot(xlim,[DATA.ff.A(iAA).range(1),...
    DATA.ff.A(iAA).range(1)],'r--')
plot(xlim,[DATA.ff.A(iAA).range(2),...
    DATA.ff.A(iAA).range(2)],'r--')

xlim([min(xRange),max(xRange)])
if ~exist('myFlag')
    ylim([DATA.ff.A(iAA).range(1),DATA.ff.A(iAA).range(2)])
end