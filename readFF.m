function DATA=readFF(nFileN,nPathName,DATA)
if nargin==2
    global DATA %METHOD
elseif nargin==3
    old.ff.A=DATA.ff.A;
end
NDATA.ff = par('par_default');
if ischar(nFileN)
    FileN = nFileN;
    FileN = strrep(FileN,'.FF','');
    FileN = strrep(FileN,'.ff','');
    PathName = nPathName;
    DATA = NDATA;
    if nargin==3
        DATA.ff.A=old.ff.A;
    end
    filename=strcat(PathName,FileN,'.FF');
    %warning off; % avoids version warnings
    %RESET
    load(filename,'*','-mat');
    if exist('filever'),
        switch filever,
            case '1.0'
                if exist('S_FR')
                    DATA.ff = S_DATA;
                    if nargin==2
                        DATA.ff.p = NDATA.ff.p;
                    end
                    DATA.data.raw = full(S_DATA.MSmatrix);
                    rmfield(DATA.ff,'MSmatrix');
                    DATA.file.ff.path = PathName;
                    DATA.file.ff.name = FileN;
                    if nargin==2
                        DATA.ff.A = par('reset_frags');
                    end
                    for i = 1:length(S_FR)
                        DATA.ff.A(i).frag.names = S_FR(i).names;
                        DATA.ff.A(i).frag.autoweight = S_FR(i).autoweight;
                        DATA.ff.A(i).frag.fitweight = S_FR(i).fitweight;
                        DATA.ff.A(i).frag.show = S_FR(i).show;
                    end
                    DATA.ff.metadata.desc1 = GUI.desc;
                    DATA.ff.metadata.desc2 = GUI.desc2;
                    DATA.acquisition.instr = 'Quad';
                else %newly converted file, uses defaults.
                    if nargin==2
                        DATA.ff.A = par('reset_frags');
                        DATA.ff.p = NDATA.ff.p;
                    end
                    DATA.data.mz=S_DATA.MZ;
                    DATA.data.raw = full(S_DATA.MSmatrix);
                    rmfield(DATA.ff,'MSmatrix');
                    DATA.file.ff.path = PathName;
                    DATA.file.ff.name = FileN;
                    DATA.acquisition.instr = 'Quad';
                end
            case '1.1'
                DATA = S_DATA;
                DATA.data.raw = full(DATA.data.raw);
                DATA.file.ff.path = PathName;
                DATA.file.ff.name = FileN;
            case '2.0'
                if exist('S_FR'),
                    DATA = S_DATA;
                    DATA.ff.p.noise = 5e3;
                    DATA.file.ff.path = PathName;
                    DATA.file.ff.name = FileN;
                    DATA.ff.A = S_FR;
                    DATA.ff.metadata.desc1 = GUI.desc;
                    DATA.ff.metadata.desc2 = GUI.desc2;
                else
                    DATA = S_DATA;
                    if nargin==2
                        DATA.ff.A = par('reset_frags');
                        DATA.ff.p = NDATA.ff.p;
                    end
                    DATA.ff.p.noise = 5e3;
                    DATA.ff.maxima = S_DATA.ff.maxima;
                    if isfield(S_DATA.ff,'spectra')
                        DATA.ff.spectra = S_DATA.ff.spectra;
                    end
                    DATA.file.ff.path = PathName;
                    DATA.file.ff.name = FileN;
                    DATA.acquisition.instr = 'TOF';
                    DATA.ff.metadata.desc1 = '';
                    DATA.ff.metadata.desc2 = '';
                end
                if ~isstruct(DATA.peaks)
                    if isfinite(DATA.peaks)
                        n = DATA.peaks;
                        DATA = rmfield(DATA,'peaks');
                        DATA.peaks.n = n;
                    end
                    if isfield(DATA,'range')
                        DATA.acquisition.range = DATA.range;
                        DATA = rmfield(DATA,'range');
                    end
                    if isfield(DATA,'name')
                        DATA.peaks.name = DATA.name;
                        DATA = rmfield(DATA,'name');
                    end
                    if isfield(DATA,'probability')
                        DATA.peaks.probability = DATA.probability;
                        DATA = rmfield(DATA,'probability');
                    end
                    if isfield(DATA,'similarity')
                        DATA.peaks.similarity = DATA.similarity;
                        DATA = rmfield(DATA,'similarity');
                    end
                    if isfield(DATA,'rt')
                        DATA.peaks.rt = DATA.rt;
                        DATA = rmfield(DATA,'rt');
                    end
                    if isfield(DATA,'area')
                        DATA.peaks.area = DATA.area;
                        DATA = rmfield(DATA,'area');
                    end
                    if isfield(DATA,'sn')
                        DATA.peaks.sn = DATA.sn;
                        DATA = rmfield(DATA,'sn');
                    end
                    if isfield(DATA,'CAS')
                        DATA.peaks.CAS = DATA.CAS;
                        DATA = rmfield(DATA,'CAS');
                    end
                    if isfield(DATA,'unique_mass')
                        DATA.peaks.unique_mass = DATA.unique_mass;
                        DATA = rmfield(DATA,'unique_mass');
                    end
                    if isfield(DATA,'ri')
                        DATA.peaks.ri = DATA.ri;
                        DATA = rmfield(DATA,'ri');
                    end
                    if isfield(DATA,'weight')
                        DATA.peaks.weight = DATA.weight;
                        DATA = rmfield(DATA,'weight');
                    end
                    if isfield(DATA,'formula')
                        DATA.peaks.formula = DATA.formula;
                        DATA = rmfield(DATA,'formula');
                    end
                    if isfield(DATA,'integration_begin')
                        DATA.peaks.integration_begin = DATA.integration_begin;
                        DATA = rmfield(DATA,'integration_begin');
                    end
                    if isfield(DATA,'integration_end')
                        DATA.peaks.integration_end = DATA.integration_end;
                        DATA = rmfield(DATA,'integration_end');
                    end
                    if isfield(DATA,'spectra')
                        DATA.peaks.spectra = DATA.spectra;
                        DATA = rmfield(DATA,'spectra');
                    end
                    if isfield(DATA,'scan_duration')
                        DATA.acquisition.scan_duration = DATA.scan_duration;
                        DATA = rmfield(DATA,'scan_duration');
                    end
                    if isfield(DATA,'solvent_delay')
                        DATA.acquisition.solvent_delay = DATA.solvent_delay;
                        DATA = rmfield(DATA,'solvent_delay');
                    end
                    if isfield(DATA,'FR_MS')
                        DATA = rmfield(DATA,'FR_MS');
                    end
                    if isfield(DATA,'dir')
                        DATA = rmfield(DATA,'dir');
                    end
                end
            case '2.1'
                DATA = S_DATA;
                DATA.data.raw = full(DATA.data.raw);
                DATA.file.ff.path = PathName;
                DATA.file.ff.name = FileN;
        end
    else
        return
    end
    if ~isfield(DATA.ff,'A');
        if nargin==2
            DATA.ff.A = par('reset_frags');
        end
    end
    if DATA.ff.maxima == 1
        DATA.ff.maxima = ff_autoaa(DATA);
    else
        
    end
    if ~isfield(DATA.ff,'spectra')
        DATA.ff = ff_parse(DATA,DATA.data.raw);
    end
    
    DATA.ff.mdva = ff_correct(DATA.ff);
    [DATA.ff.mdva,DATA.ff.fl] = ff_bmcorr(DATA.ff);
    DATA.ff.res = [];
    DATA.ff.mdvm = [];
%    [DATA.ff.mdvm,DATA.ff.res] = ff_fit(DATA.ff);
    DATA.ff.ratios = [];
    %DATA.ff.ratios = ff_metafor(new2glc(DATA.ff));
    FileN=strrep(FileN,'.ff','');
    FileN=strrep(FileN,'.FF','');
end