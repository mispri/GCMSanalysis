function varargout = par(varargin)
% c 2004 Nicola Zamboni - FiatFlux
% an_index, frags, reset_frags, par_default
global METHOD
persistent A

for i=1:nargin,
    varargout={};
    % change the value of parameter
    switch varargin{i}
        case 'init'
            A = fAnalytes_index;
            METHOD.A = fFrags;
        case 'an_index'
            A = fAnalytes_index;
            for i=1:length(A),
                assignin('caller',['' A{i}{1}],i);
                assignin('caller','A',A);
            end
        case 'reset_frags'
            varargout = [varargout {fFrags}];
        case 'par_default'
            varargout=[varargout {fExp_default}];
        otherwise
            error(['Unrecognized parameter: ''' varargin{i} '''']);
    end;
end;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ANALYTES
% defines index, const name, abbreviation for each analyte
function A = fAnalytes_index
A{1}={'ALA','A','Alanine (A)'};
A{2}={'ASP','D','Aspartate (D)'};
A{3}={'GLU','E','Glutamate (E)'};
A{4}={'GLY','G','Glycine (G)'};
A{5}={'HIS','H','Histine (H)'};
A{6}={'ILE','I','Isoleucine (I)'};
A{7}={'LEU','L','Leucine (L)'};
A{8}={'LYS','K','Lysine (K)'};
A{9}={'MET','M','Methionine (M)'};
A{10}={'PHE','F','Phenylalanine (F)'};
A{11}={'PRO','P','Proline (P)'};
A{12}={'SER','S','Serine (S)'};
A{13}={'THR','T','Threonine (T)'};
A{14}={'TYR','Y','Tyrosine (Y)'};
A{15}={'VAL','V','Valine (V)'};
%A{16}={'SAR','Sarc','Sarcosine'};
%A{17}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRAGMENTS

function AN = fFrags
par('an_index');
offset=-170;

i = ALA;
AN(i).cas= '92751-15-0';
AN(i).name = 'Alanine';
AN(i).m = 317;  %M0 of fragment
AN(i).formula = [15 35 1 2 2 0]; % C H N O Si S
AN(i).range=[180 220]+offset; %scan range in MS chromatogram
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [302 260 232 158 302]; %M0 of frags
AN(i).frag.autoweight = [0 1 1 0 0]; %weight for autosearch
AN(i).frag.fitweight = [0 1 1 0 0]; %weight for fit
AN(i).frag.show = [0 1 1 0 0]; %peaks shown in residuals window
AN(i).frag.formula(1).b = [3 5 1 2 0 0]; % amount of atoms from analyte for frag 1
AN(i).frag.formula(1).d = [11 27 0 0 2 0]; % amount of atoms added through derivatization for frag 1
AN(i).frag.formula(2).b = [3 5 1 2 0 0]; 
AN(i).frag.formula(2).d = [8 21 0 0 2 0];
AN(i).frag.formula(3).b = [2 5 1 1 0 0];
AN(i).frag.formula(3).d = [8 21 0 0 2 0];
AN(i).frag.formula(4).b = [2 5 1 0 0 0];
AN(i).frag.formula(4).d = [6 15 0 0 1 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];


i = ASP;
AN(i).cas= '107715-96-8';
AN(i).name = 'Aspartic acid';
AN(i).m = 475;  
AN(i).formula = [22 49 1 4 3 0];
AN(i).range=[760 800]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [460 418 390 316 302]; 
AN(i).frag.autoweight = [1 1 1 1 1]; 
AN(i).frag.fitweight = [1 1 1 1 1]; 
AN(i).frag.show = [1 1 1 1 1]; 
AN(i).frag.formula(1).b = [4 4 1 4 0 0]; 
AN(i).frag.formula(1).d = [17 42 0 0 3 0];
AN(i).frag.formula(2).b = [4 4 1 4 0 0]; 
AN(i).frag.formula(2).d = [14 36 0 0 3 0];
AN(i).frag.formula(3).b = [3 4 1 3 0 0];
AN(i).frag.formula(3).d = [14 36 0 0 3 0];
AN(i).frag.formula(4).b = [3 4 1 3 0 0];
AN(i).frag.formula(4).d = [12 30 0 0 2 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];


i = GLU;
AN(i).cas= '107715-97-9';
AN(i).name = 'Glutamic acid';
AN(i).m = 489;  
AN(i).formula = [23 51 1 4 3 0]; 
AN(i).range=[860 900]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [474 432 404 330 302]; 
AN(i).frag.autoweight = [1 1 1 1 1]; 
AN(i).frag.fitweight = [1 1 1 1 0]; 
AN(i).frag.show = [1 1 1 1 1]; 
AN(i).frag.formula(1).b = [5 6 1 4 0 0]; 
AN(i).frag.formula(1).d = [17 42 0 0 3 0];
AN(i).frag.formula(2).b = [5 6 1 4 0 0]; 
AN(i).frag.formula(2).d = [14 36 0 0 3 0];
AN(i).frag.formula(3).b = [4 6 1 3 0 0];
AN(i).frag.formula(3).d = [14 36 0 0 3 0];
AN(i).frag.formula(4).b = [4 6 1 3 0 0];
AN(i).frag.formula(4).d = [12 30 0 0 2 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];

i = GLY;
AN(i).cas= '107715-88-8';
AN(i).name = 'Glycine';
AN(i).m = 303; 
AN(i).formula = [14 33 1 2 2 0]; 
AN(i).range=[210 250]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159'};
AN(i).frag.mz = [288 246 218 144]; 
AN(i).frag.autoweight = [1 1 1 0]; 
AN(i).frag.fitweight = [1 1 1 0]; 
AN(i).frag.show = [1 1 1 0]; 
AN(i).frag.formula(1).b = [2 3 1 2 0 0];
AN(i).frag.formula(1).d = [11 27 0 0 2 0]; 
AN(i).frag.formula(2).b = [2 3 1 2 0 0]; 
AN(i).frag.formula(2).d = [8 21 0 0 2 0];
AN(i).frag.formula(3).b = [1 3 1 1 0 0];
AN(i).frag.formula(3).d = [8 21 0 0 2 0];
AN(i).frag.formula(4).b = [1 3 1 0 0 0];
AN(i).frag.formula(4).d = [6 15 0 0 1 0];

i = HIS;
AN(i).cas= '107716-00-7';
AN(i).name = 'Histidine';
AN(i).m = 497;  
AN(i).formula = [24 51 3 2 3 0]; 
AN(i).range=[1480 1590]+offset;
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [482 440 412 338 302]; 
AN(i).frag.autoweight = [0 10 1 1 0]; 
AN(i).frag.fitweight = [0 0 0 0 0]; 
AN(i).frag.show = [1 1 1 1 1]; 
AN(i).frag.formula(1).b = [6 6 3 2 0 0]; 
AN(i).frag.formula(1).d = [17 42 0 0 3 0]; 
AN(i).frag.formula(2).b = [6 6 3 2 0 0]; 
AN(i).frag.formula(2).d = [14 36 0 0 3 0];
AN(i).frag.formula(3).b = [5 6 3 1 0 0];
AN(i).frag.formula(3).d = [14 36 0 0 3 0];
AN(i).frag.formula(4).b = [5 6 3 0 0 0];
AN(i).frag.formula(4).d = [12 30 0 0 2 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];

i = ILE;
AN(i).cas= '107715-90-2';
AN(i).name = 'Isoleucine';
AN(i).m = 359; 
AN(i).formula = [18 41 1 2 2 0]; 
AN(i).range=[370 400]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [344 302 274 200 302]; 
AN(i).frag.autoweight = [1 1 1 1 1]; 
AN(i).frag.fitweight = [1 0 1 1 0]; 
AN(i).frag.show = [1 1 1 1 1];
AN(i).frag.formula(1).b = [6 11 1 2 0 0];
AN(i).frag.formula(1).d = [11 27 0 0 2 0]; 
AN(i).frag.formula(2).b = [6 11 1 2 0 0]; 
AN(i).frag.formula(2).d = [8 21 0 0 2 0];
AN(i).frag.formula(3).b = [5 11 1 1 0 0];
AN(i).frag.formula(3).d = [8 21 0 0 2 0];
AN(i).frag.formula(4).b = [5 11 1 0 0 0];
AN(i).frag.formula(4).d = [6 15 0 0 1 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];

i = LEU;
AN(i).cas= '92771-65-8';
AN(i).name = 'Leucine';
AN(i).m = 359; 
AN(i).formula = [18 41 1 2 2 0]; 
AN(i).range=[340 370]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [344 302 274 200 302]; 
AN(i).frag.autoweight = [1 1 1 1 1];
AN(i).frag.fitweight = [1 0 1 1 0]; 
AN(i).frag.show = [1 1 1 1 1]; 
AN(i).frag.formula(1).b = [6 11 1 2 0 0]; 
AN(i).frag.formula(1).d = [11 27 0 0 2 0];
AN(i).frag.formula(2).b = [6 11 1 2 0 0]; 
AN(i).frag.formula(2).d = [8 21 0 0 2 0];
AN(i).frag.formula(3).b = [5 11 1 1 0 0];
AN(i).frag.formula(3).d = [8 21 0 0 2 0];
AN(i).frag.formula(4).b = [5 11 1 0 0 0];
AN(i).frag.formula(4).d = [6 15 0 0 1 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];

i = LYS;
AN(i).cas= '107715-99-1';
AN(i).name = 'Lysine';
AN(i).m = 488;  
AN(i).formula = [24 56 2 2 3 0]; 
AN(i).range=[950 990]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [473 431 403 329 302];
AN(i).frag.autoweight = [1 1 0 1 1]; 
AN(i).frag.fitweight = [0 1 0 1 0];
AN(i).frag.show = [1 1 0 1 1]; 
AN(i).frag.formula(1).b = [6 11 2 2 0 0]; 
AN(i).frag.formula(1).d = [17 42 0 0 3 0]; 
AN(i).frag.formula(2).b = [6 11 2 2 0 0]; 
AN(i).frag.formula(2).d = [14 36 0 0 3 0];
AN(i).frag.formula(3).b = [5 11 2 1 0 0];
AN(i).frag.formula(3).d = [14 36 0 0 3 0];
AN(i).frag.formula(4).b = [5 11 2 0 0 0];
AN(i).frag.formula(4).d = [12 30 0 0 2 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];

i = MET;
AN(i).cas= '107715-92-4';
AN(i).name = 'Methionine';
AN(i).m = 377; 
AN(i).formula = [17 39 1 2 2 1]; 
AN(i).range=[600 640]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [362 320 292 218 302];
AN(i).frag.autoweight = [1 1 1 1 0]; 
AN(i).frag.fitweight = [0 1 1 1 0];
AN(i).frag.show = [1 1 1 1 0]; 
AN(i).frag.formula(1).b = [5 9 1 2 0 1]; 
AN(i).frag.formula(1).d = [11 27 0 0 2 0]; 
AN(i).frag.formula(2).b = [5 9 1 2 0 1]; 
AN(i).frag.formula(2).d = [8 21 0 0 2 0];
AN(i).frag.formula(3).b = [4 9 1 1 0 1];
AN(i).frag.formula(3).d = [8 21 0 0 2 0];
AN(i).frag.formula(4).b = [4 9 1 0 0 1];
AN(i).frag.formula(4).d = [6 15 0 0 1 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];

i = PHE;
AN(i).cas= '107715-95-7';
AN(i).name = 'Phenylalanine';
AN(i).m = 393; 
AN(i).formula = [21 39 1 2 2 0]; 
AN(i).range=[710 750]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [378 336 308 234 302]; 
AN(i).frag.autoweight = [0 1 1 1 1];
AN(i).frag.fitweight = [0 1 1 1 1]; 
AN(i).frag.show = [0 1 1 1 1]; 
AN(i).frag.formula(1).b = [9 9 1 2 0 0]; 
AN(i).frag.formula(1).d = [11 27 0 0 2 0];
AN(i).frag.formula(2).b = [9 9 1 2 0 0]; 
AN(i).frag.formula(2).d = [8 21 0 0 2 0];
AN(i).frag.formula(3).b = [8 9 1 1 0 0];
AN(i).frag.formula(3).d = [8 21 0 0 2 0];
AN(i).frag.formula(4).b = [8 9 1 0 0 0];
AN(i).frag.formula(4).d = [6 15 0 0 1 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];

i = PRO;
AN(i).cas= '107715-91-3';
AN(i).name = 'Proline';
AN(i).m = 343; 
AN(i).formula = [17 37 1 2 2 0]; 
AN(i).range=[410 450]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [328 286 258 184 302]; 
AN(i).frag.autoweight = [1 1 1 0 0];
AN(i).frag.fitweight = [1 0 1 0 0]; 
AN(i).frag.show = [1 1 1 0 0]; 
AN(i).frag.formula(1).b = [5 7 1 2 0 0]; 
AN(i).frag.formula(1).d = [11 27 0 0 2 0];
AN(i).frag.formula(2).b = [5 7 1 2 0 0]; 
AN(i).frag.formula(2).d = [8 21 0 0 2 0];
AN(i).frag.formula(3).b = [4 7 1 1 0 0];
AN(i).frag.formula(3).d = [8 21 0 0 2 0];
AN(i).frag.formula(4).b = [4 7 1 0 0 0];
AN(i).frag.formula(4).d = [6 15 0 0 1 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];

i = SER;
AN(i).cas= '107715-93-5';
AN(i).name = 'Serine';
AN(i).m = 447;  
AN(i).formula = [21 49 1 3 3 0]; 
AN(i).range=[610 650]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [432 390 362 288 302];
AN(i).frag.autoweight = [1 1 1 1 1]; 
AN(i).frag.fitweight = [1 1 1 1 1];
AN(i).frag.show = [1 1 1 1 1]; 
AN(i).frag.formula(1).b = [3 4 1 3 0 0]; 
AN(i).frag.formula(1).d = [17 42 0 0 3 0]; 
AN(i).frag.formula(2).b = [3 4 1 3 0 0]; 
AN(i).frag.formula(2).d = [14 36 0 0 3 0];
AN(i).frag.formula(3).b = [2 4 1 2 0 0];
AN(i).frag.formula(3).d = [14 36 0 0 3 0];
AN(i).frag.formula(4).b = [2 4 1 1 0 0 ];
AN(i).frag.formula(4).d = [12 30 0 0 2 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];

i = THR;
AN(i).cas= '107715-94-6';
AN(i).name = 'Threonine';
AN(i).m = 461;  
AN(i).formula = [22 51 1 3 3 0]; 
AN(i).range=[640 680]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [446 404 376 302 302];
AN(i).frag.autoweight = [1 1 1 0 0]; 
AN(i).frag.fitweight = [1 1 1 0 0];
AN(i).frag.show = [1 1 1 0 0]; 
AN(i).frag.formula(1).b = [4 6 1 3 0 0]; 
AN(i).frag.formula(1).d = [17 42 0 0 3 0]; 
AN(i).frag.formula(2).b = [4 6 1 3 0 0]; 
AN(i).frag.formula(2).d = [14 36 0 0 3 0];
AN(i).frag.formula(3).b = [3 6 1 2 0 0];
AN(i).frag.formula(3).d = [14 36 0 0 3 0];
AN(i).frag.formula(4).b = [3 6 1 1 0 0];
AN(i).frag.formula(4).d = [12 30 0 0 2 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];

i = TYR;
AN(i).cas= '107716-04-8';
AN(i).name = 'Tyrosine';
AN(i).m = 523;  
AN(i).formula = [27 53 1 3 3 0]; 
AN(i).range=[1150 1190]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [508 466 438 364 302];
AN(i).frag.autoweight = [1 1 0 1 0]; 
AN(i).frag.fitweight = [0 1 0 1 0];
AN(i).frag.show = [1 1 1 1 0]; 
AN(i).frag.formula(1).b = [9 8 1 3 0 0]; 
AN(i).frag.formula(1).d = [17 42 0 0 3 0]; 
AN(i).frag.formula(2).b = [9 8 1 3 0 0]; 
AN(i).frag.formula(2).d = [14 36 0 0 3 0];
AN(i).frag.formula(3).b = [8 8 1 2 0 0];
AN(i).frag.formula(3).d = [14 36 0 0 3 0];
AN(i).frag.formula(4).b = [8 8 1 1 0 0];
AN(i).frag.formula(4).d = [12 30 0 0 2 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];

i = VAL;
AN(i).cas= '107715-89-9';
AN(i).name = 'Valine';
AN(i).m = 330; 
AN(i).formula = [17 37 1 2 2 0]; 
AN(i).range=[180 260]+offset; 
AN(i).range=[290 330]+offset; 
AN(i).frag.names = {'-15' '-57' '-85' '-159' 'f302'};
AN(i).frag.mz = [330 288 260 186 302]; 
AN(i).frag.autoweight = [1 1 1 1 1];
AN(i).frag.fitweight = [0 1 1 0 0]; 
AN(i).frag.show = [1 1 1 1 1]; 
AN(i).frag.formula(1).b = [5 9 1 2 0 0]; 
AN(i).frag.formula(1).d = [11 27 0 0 2 0];
AN(i).frag.formula(2).b = [5 9 1 2 0 0]; 
AN(i).frag.formula(2).d = [8 21 0 0 2 0];
AN(i).frag.formula(3).b = [4 9 1 1 0 0];
AN(i).frag.formula(3).d = [8 21 0 0 2 0];
AN(i).frag.formula(4).b = [4 9 1 0 0 0];
AN(i).frag.formula(4).d = [6 15 0 0 1 0];
AN(i).frag.formula(5).b = [2 2 1 2 0 0];
AN(i).frag.formula(5).d = [12 30 0 0 2 0];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEFAULT PARAMETERS

function ff = fExp_default

ff.p.label = 1; %13C glucose
ff.p.model = 2;          % model index
ff.defaultpath = 'C:\Matlab7\work\';
ff.p.noise = 2e6;        % MS noise threshold
ff.p.mserr = 0.01;       % MS precision
ff.p.unlabeled_bm = 0.01;      % fraction of unlabeled biomass
ff.p.glc.uc.f = 0.2;     % [U-13C]glucose fraction
ff.p.glc.uc.p = 0.99;   % [U-13C]glucose purity
ff.p.glc.c1.f = 0;       % [1-13C]glucose fraction
ff.p.glc.nat.f = 1 - ff.p.glc.c1.f-ff.p.glc.uc.f;
ff.p.glc.c1.p = 0.99;    % [1-13C]glucose purity
ff.metadata.desc1 = '';
ff.metadata.desc2 = '';
ff.maxima = 1;         % m(Analytes) x n(start,apex,end) 
ff.MSmatrix = [];      % m(scans) x (m/z intensity)
ff.mdva = [];
ff.mdvm = [];
ff.res =[];            % residuals after fit
ff.ratios = [];





