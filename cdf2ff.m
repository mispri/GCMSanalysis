function cdf2ff(varargin)
% convert Quad *.cdf files to FiatFlux *.ff files  
% supports multiple files
% requires netcdf.dll and the newest mexcdf toolbox
% http://mexcdf.sourceforge.net/downloads/
% NO error treatment implemented
% program overwrites existing files

[FileNames,PathName] = uigetfile({'*.cdf','*.CDF'},'Select the GC-MS CDF file','MultiSelect', 'on');
if ischar(FileNames),
    FileNames = {FileNames};
end
if iscell(FileNames),
    for fileindex = 1:length(FileNames),
        FileN = char(FileNames(fileindex));
        % opens cdf file for reading only
        f = mexcdf('open',strcat(PathName,FileN),'nowrite');
        
        %retrieve data from CDF files
        scan_index = mexnc('GET_VAR_INT',f,mexnc('INQ_VARID',f,'scan_index'));
        SCANS = length(scan_index); %total number of scans...
        mass_values = mexnc('GET_VAR_FLOAT',f,mexnc('INQ_VARID',f,'mass_values'));
        intensity_values = mexnc('GET_VAR_FLOAT',f,mexnc('INQ_VARID',f,'intensity_values'));
        point_count = mexnc('GET_VAR_INT',f,mexnc('INQ_VARID',f,'point_count'));
        %MASS_MAX = mexnc('GET_VAR_FLOAT',f,mexnc('INQ_VARID',f,'mass_range_max'));
        %MASS_MAX = max(round(MASS_MAX));
        MASS_MAX = max(round(mass_values));
        
        %closes cdf file
        status = mexnc('close',f);
        
        %renames file without file extentions..
        FileN = strrep(FileN,'.cdf','');
        FileN = strrep(FileN,'.CDF','');

        MS = zeros(SCANS ,round(MASS_MAX));
        MZ = zeros(SCANS ,round(MASS_MAX));
        %actual_scan = 1;
        %scan_index(1) = 1;
        index = 0;

        hw = waitbar(0,'Building MS matrix...','Name',['Convert ' FileN '.CDF']);
        %while actual_scan < SCANS,
        for actual_scan = 1:SCANS-1      
            
            for index = (1+scan_index(actual_scan)):(1+(scan_index(actual_scan) + point_count(actual_scan))),
               
                index2 = round(mass_values(index));
                % some arbitrary minimal intensity value???
                
                %if (intensity_values(index) > 50 )
                if intensity_values(index) > 10,
                %    [MS(actual_scan,index2), intensity_values(index) ]
                    MS(actual_scan,index2) = MS(actual_scan,index2) + intensity_values(index);
                    MZ(actual_scan,index2) = MZ(actual_scan,index2) + intensity_values(index);
                end
                
            end
            %actual_scan = actual_scan + 1;
            waitbar(actual_scan/SCANS,hw);
        end
        close(hw);
        S_DATA.MSmatrix = sparse(MS);
        S_DATA.MZ = sparse(MZ);
        % replaces if existing !!
        filever = '1.0';
        save([PathName,FileN,'.ff'],'S_DATA','filever','-mat');
    end
end