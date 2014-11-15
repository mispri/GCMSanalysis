function DFF = ff_parse (D,rawdata)
% c 2006 Nicola Zamboni - FiatFlux
global METHOD
DFF = D.ff;
N_METHOD = par('reset_frags');
ran = 14; % range of m/z values stored
par('an_index');
A_total = length(A);
%fragments_number = [];
%for i=1:length(DFF.AN),
%    fragments_number(i) = length(DFF.AN(i).frag.mz);
%end
switch D.acquisition.instr
    case 'TOF'
        for i=1:A_total
            if DFF.maxima(i,3)>0
                for j=1:length(DFF.A(i).frag.mz)
                    B = full(rawdata(DFF.maxima(i,1):DFF.maxima(i,2),DFF.A(i).frag.mz(j)-1:DFF.A(i).frag.mz(j)+ran));
                    timepoints = find(B(:,2)+B(:,3)>DFF.p.noise);
                    DFF.spectra(i,j).scans = DFF.maxima(i,1)+timepoints-1;
                    if ~isfield(DFF.spectra(i,j),'corr')
                        DFF.spectra(i,j).corr = 0;
                    end
                    if ~isempty(timepoints) %& DFF.spectra(i,j).corr>-1
                        DFF.spectra(i,j).raw = B(timepoints,:);
                        DFF.spectra(i,j).rawsum = sum(DFF.spectra(i,j).raw,1);
                        baseline = median(D.data.raw(:));
                        DFF.spectra(i,j).bl = DFF.spectra(i,j).raw - baseline;
                        if ~isfield(DFF.spectra(i,j),'corr_param')
                            DFF.spectra(i,j).corr_param = [] ;
                        end
                        if isempty(DFF.spectra(i,j).corr_param)
                            DFF.spectra(i,j).corr_param=[0 0 0];
                        end
                        B2 = ms_corr(B(timepoints,:),DFF.spectra(i,j).corr_param);
                        DFF.spectra(i,j).corr = B2(:,2:12);
                        DFF.spectra(i,j).corrsum = sum(DFF.spectra(i,j).corr,1);
                    else

                        DFF.spectra(i,j).raw=[];
                        DFF.spectra(i,j).rawsum=[];
                        DFF.spectra(i,j).bl=[];
                        DFF.spectra(i,j).corr=[];
                        DFF.spectra(i,j).corrsum=[];
                        DFF.spectra(i,j).corr_param=[];
                        DFF.spectra(i,j).corr_confidence=[];
                        DFF.A(i).frag.fitweight(j)=0;

                    end
                    if ~sum(DFF.A(i).frag.show)
                        DFF.A(i).frag.fitweight = N_METHOD(i).frag.fitweight;
                        DFF.A(i).frag.show = N_METHOD(i).frag.show;
                    end
                end
            else
                for j=1:length(DFF.A(i).frag.mz),
                    DFF.spectra(i,j).raw=[];
                    DFF.spectra(i,j).rawsum=[];
                    DFF.spectra(i,j).bl=[];
                    DFF.spectra(i,j).corr=[];
                    DFF.spectra(i,j).corrsum=[];
                    DFF.spectra(i,j).corr_param=[];
                    DFF.spectra(i,j).corr_confidence=[];
            DFF.A(i).frag.fitweight(j)=0;
        end
        DFF.A(i).frag.fitweight(:) = 0;
        DFF.A(i).frag.show = N_METHOD(i).frag.show;
    end
end
    otherwise
        threshold = 1e4;
        for i=1:A_total
            if DFF.maxima(i,3)>0
                for j=1:length(DFF.A(i).frag.mz)
                    if DFF.A(i).frag.mz(j)+ran <= size(rawdata,2);
                        rounds = 5;
                        flank = 20;
                        if (i==15) && (j==5)
                            j;
                        end
                        B = full(rawdata(DFF.maxima(i,1):DFF.maxima(i,2),DFF.A(i).frag.mz(j)-1:DFF.A(i).frag.mz(j)+ran));
                        Bleft = full(rawdata(max([1 DFF.maxima(i,1)-flank-1]):DFF.maxima(i,1),DFF.A(i).frag.mz(j)-1:DFF.A(i).frag.mz(j)+ran));
                        Bright = full(rawdata(DFF.maxima(i,2):DFF.maxima(i,2)+flank,DFF.A(i).frag.mz(j)-1:DFF.A(i).frag.mz(j)+ran));
                        for q = 1:ran+2
                            Bt = B(:,q);
                            bl = min([mean(Bleft(:,q)) mean(Bright(:,q)) ]);
                           
                            %bl = polyfit([(1-size(Bleft,1)):0 DFF.maxima(i,2)-DFF.maxima(i,1)+(0:flank)], [Bleft(:,q)' Bright(:,q)'],1);
                           % B(:,q) = Bt - bl; %polyval(P,0:(DFF.maxima(i,2)-DFF.maxima(i,1)))';
                            %bl = polyval(P,(-1-size(Bleft,1)):(DFF.maxima(i,2)-DFF.maxima(i,1))+flank);
                            %plot([[Bleft(:,q) Bleft(:,q);  B(:,q) Bt;Bright(:,q) Bright(:,q) ] bl']);
                        end
                        B(find(B<0))=0;
                        timepoints = find(B(:,2)+B(:,3)>threshold);
                        DFF.spectra(i,j).scans = DFF.maxima(i,1)+timepoints-1;
                    else
                        timepoints=[];
                    end
                    if ~isempty(timepoints)
                        DFF.spectra(i,j).aaa = [Bleft' B(timepoints,:)' Bright']';
                        DFF.spectra(i,j).raw = B(timepoints,:);
                        DFF.spectra(i,j).raw(find(DFF.spectra(i,j).raw<0))=0;
                        DFF.spectra(i,j).rawsum = sum(DFF.spectra(i,j).raw,1);
                        
                        baseline = 0;
                        DFF.spectra(i,j).bl = DFF.spectra(i,j).raw - baseline;
                        B2 = B(timepoints,:);
                        DFF.spectra(i,j).corr_param = [0 0 0];
                        DFF.spectra(i,j).corr_confidence = 1;
                        DFF.spectra(i,j).corr = B2(:,2:12);
                        DFF.spectra(i,j).corrsum = sum(DFF.spectra(i,j).corr,1);
                        %          [tmp,apex] = max(B(timepoints,2));
                        %          DFF.maxima(i,1:3) = round(D.integration_begin(vip(di),1)-D(di).solvent_delay)/D(di).scan_duration+[timepoints(1) timepoints(length(timepoints)) timepoints(1)+apex-1];
                    else

                        DFF.spectra(i,j).raw=[];
                        DFF.spectra(i,j).rawsum=[];
                        DFF.spectra(i,j).bl=[];
                        DFF.spectra(i,j).corr=[];
                        DFF.spectra(i,j).corrsum=[];
                        DFF.spectra(i,j).corr_param=[];
                        DFF.spectra(i,j).corr_confidence=[];
                        DFF.A(i).frag.fitweight(j) = 0;

                    end
                    if ~sum(DFF.A(i).frag.show)
                        DFF.A(i).frag.fitweight = N_METHOD(i).frag.fitweight;
                        DFF.A(i).frag.show = N_METHOD(i).frag.show;
                    end
                    
                end
            else
                for j=1:length(DFF.A(i).frag.mz),
                    DFF.spectra(i,j).raw=[];
                    DFF.spectra(i,j).rawsum=[];
                    DFF.spectra(i,j).bl=[];
                    DFF.spectra(i,j).corr=[];
                    DFF.spectra(i,j).corrsum=[];
                    DFF.spectra(i,j).corr_param=[];
                    DFF.spectra(i,j).corr_confidence=[];
                end
                DFF.A(i).frag.fitweight(:) = 0;
                DFF.A(i).frag.show = N_METHOD(i).frag.show;
            end
        end
end


