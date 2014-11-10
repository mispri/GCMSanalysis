function varargout = parinitialize
%take an AA run and find the correct position of all the peaks

%interactivelly open up the AA standard
[fileNameAASTD,dataFolderName,filterIndex]=uigetfile('*.ff');

%Open the AA Standard
%grab the data and stick in to DATA structure
DATA=readFF(fileNameAASTD,dataFolderName);

global result

%Start with a good diagnostic Amino Acid
%Good test are 12, 13, and 10
result.done=0;
result.pos=[];

h=viewsingleaa(DATA,12,'Serine');
result.start=ylim;

set(h, 'Renderer', 'OpenGL');

%set(h, 'WindowButtonDownFcn', {@MouseClick,result});
%set(h, 'WindowButtonDownFcn', {'result=MouseClick',result});
set(h, 'WindowButtonDownFcn', @MouseClick)
%set(h, 'WindowButtonMotionFcn', @MouseMove);
%set(h, 'WindowScrollWheelFcn', @MouseScroll);
set(h, 'KeyPressFcn', {@KeyPress, DATA} )

%    k = waitforbuttonpress;



function result=MouseClick(hObject,~)
global result
pos=get(hObject,'CurrentPoint');
result.pos(end+1,:)=pos;
if size(result.pos,1)>2
    result.pos(1,:)=[];
end
if size(result.pos,1)==2
ylim(sort([result.pos(1,2),result.pos(2,2)]))
end

function result=KeyPress(~,Event,DATA)
global result
switch Event.Character
    
    case {'q', 'Q'}
        
        %Go through each amino acid
        %this is a test at the beginning to find the amino acids on a first run
        for iAA=1:length(DATA.ff.A)
            viewsingleaa(DATA,iAA);
        end
        
    case {'u', 'U'}
        
        result.pos=[];
        ylim(result.start);
end
