
%alanine
AA(1).frag(2).prediction = [c12 0 0 c13];
AA(1).frag(3).prediction = [c12 0 c13];

%apartate
% %TCA (1 1 2)
% AA(2).frag(1).prediction = [c12  0 0 c13];
% AA(2).frag(2).prediction = [c12 0 c13];
% AA(2).frag(3).prediction = [c12 0 0 c13];
% AA(2).frag(5).prediction = [c12 0 c13];
fumSym=0;%what fraction of the oxaloacetate is symmetric (due to reverse TCA to fumerate)
%The max of the above number is 0.5

% Anapleurotic (1 3)
AA(2).frag(1).prediction.anapleurotic.hex = [c12^2 c12*c13 0 c12*c13 c13^2];
AA(2).frag(1).prediction.anapleurotic.air = [c12 0 0 c13 0];
AA(2).frag(2).prediction.anapleurotic.hex = [c12^2 c12*c13 0 c12*c13 c13^2];
AA(2).frag(2).prediction.anapleurotic.air = [c12 0 0 c13 0];
AA(2).frag(3).prediction.anapleurotic.hex = [c12^2 c12*c13 c12*c13 c13^2];%need to confirm 3 and 4 for fumarate
AA(2).frag(3).prediction.anapleurotic.air = [c12 0 c13*fumSym c13*(1-fumSym)];
AA(2).frag(4).prediction.anapleurotic.hex = [c12^2 c12*c13 c12*c13 c13^2];
AA(2).frag(4).prediction.anapleurotic.air = [c12 0 c13*fumSym c13*(1-fumSym)];

%glutamate
AA(3).frag(1).prediction.anapleurotic.hex = [c12^3 c12^2*c13 2*c12^2*c13 2*c12*c13^2 c12*c13^2 c13^3];
AA(3).frag(1).prediction.anapleurotic.air = [c12^3 c12^2*c13 2*c12^2*c13 2*c12*c13^2 c12*c13^2 c13^3];
AA(3).frag(2).prediction.anapleurotic.hex = [c12^3 c12^2*c13 2*c12^2*c13 2*c12*c13^2 c12*c13^2 c13^3];
AA(3).frag(2).prediction.anapleurotic.air = [c12^3 c12^2*c13 2*c12^2*c13 2*c12*c13^2 c12*c13^2 c13^3];
AA(3).frag(3).prediction = [c12*c12 0 2*c12*c13 0 c13*c13];
AA(3).frag(5).prediction.anapleurotic.hex = [c12^2 0 c13^2]*fumSym+[c12 0 c13]*(1-fumSym);
AA(3).frag(5).prediction.anapleurotic.air = [c12 c13 0]*fumSym+[c12 0 c13]*(1-fumSym);

%glycine
AA(4).frag(1).prediction = [c12 0 c13];
AA(4).frag(2).prediction = [c12 0 c13];
AA(4).frag(3).prediction = [c12 c13];

%histidine

%isoleucine
AA(6).frag(1).prediction.anapleurotic.hex = [c12^2 c12*c13 0 c12*c13 c13^2];
AA(6).frag(1).prediction.anapleurotic.air = [c12^2 0 c12*c13 c12*c13 0 c13^2 0];
AA(6).frag(2).prediction.anapleurotic.hex = [c12^3 c12^2*c13 c12^2*c13 c12*c13^2+c12^2*c13 c12*c13^2 c12*c13^2 c13^3];
AA(6).frag(2).prediction.anapleurotic.air = [c12^2 0 c12*c13 c12*c13 0 c13^2 0];
AA(6).frag(4).prediction.anapleurotic.hex = [c12^3 c12^2*c13 2*c12^2*c13 2*c12*c13^2 c12*c13^2 c13^3];
AA(6).frag(4).prediction.anapleurotic.air = [c12^2 0 2*c12*c13*fumSym 2*c12*c13*(1-fumSym) c13^2*fumSym c13^2*(1-fumSym)];
AA(6).frag(4).prediction.anapleurotic.hex = [c12^3 c12^2*c13 2*c12^2*c13 2*c12*c13^2 c12*c13^2 c13^3];
AA(6).frag(4).prediction.anapleurotic.air = [c12^2 0 2*c12*c13*fumSym 2*c12*c13*(1-fumSym) c13^2*fumSym c13^2*(1-fumSym)];

%leucine
AA(7).frag(1).prediction = [c12^3 0 3*c12^2*c13 0 3*c12*c13^2 0 c13^3];
AA(7).frag(2).prediction = [c12^3 0 3*c12^2*c13 0 3*c12*c13^2 0 c13^3];
AA(7).frag(3).prediction = [c12^3 c12^2*c13 2*c12^2*c13 2*c12*c13^2 c12*c13^2 c13^3];

%lysine
AA(8).frag(1).prediction = [c12^3 0 3*c12^2*c13 0 3*c12*c13^2 0 c13^3];
AA(8).frag(2).prediction = [c12^3 0 3*c12^2*c13 0 3*c12*c13^2 0 c13^3];
AA(8).frag(3).prediction = [c12^3 c12^2*c13 2*c12^2*c13 2*c12*c13^2 c12*c13^2 c13^3];

%methionine

%phenylalanine
AA(10).frag(1).prediction = (0.5+(c12^2+c13^2)/2)*[c12^3 0 c12^2*c13 c12^2*c13 c12^2*c13 c12*c13^2 c12*c13^2 c12*c13^2 0 c13^3]...
                           +(2*c12*c13)/2*[0 c12^3 0 2*c12^2*c13 c12^2*c13 c12*c13^2 2*c12*c13^2 0 c13^3 0];
AA(10).frag(2).prediction = (0.5+(c12^2+c13^2)/2)*[c12^3 0 c12^2*c13 c12^2*c13 c12^2*c13 c12*c13^2 c12*c13^2 c12*c13^2 0 c13^3]...
                           +(2*c12*c13)/2*[0 c12^3 0 2*c12^2*c13 c12^2*c13 c12*c13^2 2*c12*c13^2 0 c13^3 0];                       
AA(10).frag(3).prediction =(0.5+(c12^2+c13^2)/2)*[c12^3 0 2*c12^2*c13 0 c12^2*c13+c12*c13^2 0 2*c12*c13^2 0 c13^3]...
                           +(2*c12*c13)/2*[0 c12^3 0 2*c12^2*c13+c12*c13^2 0 2*c12*c13^2+c12^2*c13 0 c13^3 0];
AA(10).frag(4).prediction =(0.5+(c12^2+c13^2)/2)*[c12^3 0 2*c12^2*c13 0 c12^2*c13+c12*c13^2 0 2*c12*c13^2 0 c13^3]...
                           +(2*c12*c13)/2*[0 c12^3 0 2*c12^2*c13+c12*c13^2 0 2*c12*c13^2+c12^2*c13 0 c13^3 0];
AA(10).frag(5).prediction = [c12 0 c13];

%proline
AA(11).frag(3).prediction = [c12*c12 0 2*c12*c13 0 c13*c13];
AA(11).frag(4).prediction = [c12*c12 0 2*c12*c13 0 c13*c13];

%serine
AA(12).frag(1).prediction.hex = [c12 0 0 c13];
AA(12).frag(1).prediction.shm1and2 = [c12^2 c12*c13 c12*c13 c13^2];
AA(12).frag(2).prediction.hex = [c12 0 0 c13];
AA(12).frag(2).prediction.shm1and2 = [c12^2 c12*c13 c12*c13 c13^2];
AA(12).frag(3).prediction.hex = [c12 0 c13];
AA(12).frag(3).prediction.shm1and2 = [c12^2 2*c12*c13 c13^2];
AA(12).frag(4).prediction.hex = [c12 0 c13];
AA(12).frag(4).prediction.shm1and2 = [c12^2 2*c12*c13 c13^2];
AA(12).frag(5).prediction = [c12 0 c13];

%threonine
% Anapleurotic (1 3)
AA(13).frag(1).prediction.anapleurotic.hex = [c12^2 c12*c13 0 c12*c13 c13^2];
AA(13).frag(1).prediction.anapleurotic.air = [c12 0 0 c13 0];
AA(13).frag(2).prediction.anapleurotic.hex = [c12^2 c12*c13 0 c12*c13 c13^2];
AA(13).frag(2).prediction.anapleurotic.air = [c12 0 0 c13 0];
AA(13).frag(3).prediction.anapleurotic.hex = [c12^2 c12*c13 c12*c13 c13^2];
AA(13).frag(3).prediction.anapleurotic.air = [c12 0 c13*fumSym c13*(1-fumSym)];
AA(13).frag(4).prediction.anapleurotic.hex = [c12^2 c12*c13 c12*c13 c13^2];%need to check for fumarate
AA(13).frag(4).prediction.anapleurotic.air = [c12 0 c13*fumSym c13*(1-fumSym)];
AA(13).frag(5).prediction.anapleurotic.hex = [c12^2 0 c13^2];
AA(13).frag(5).prediction.anapleurotic.air = [c12 0 c13*fumSym c13*(1-fumSym)];


%tyrosine
AA(14).frag(1).prediction = (0.5+(c12^2+c13^2)/2)*[c12^3 0 c12^2*c13 c12^2*c13 c12^2*c13 c12*c13^2 c12*c13^2 c12*c13^2 0 c13^3]...
                           +(2*c12*c13)/2*[0 c12^3 0 2*c12^2*c13 c12^2*c13 c12*c13^2 2*c12*c13^2 0 c13^3 0];
AA(14).frag(2).prediction = (0.5+(c12^2+c13^2)/2)*[c12^3 0 c12^2*c13 c12^2*c13 c12^2*c13 c12*c13^2 c12*c13^2 c12*c13^2 0 c13^3]...
                           +(2*c12*c13)/2*[0 c12^3 0 2*c12^2*c13 c12^2*c13 c12*c13^2 2*c12*c13^2 0 c13^3 0];                       
AA(14).frag(3).prediction =(0.5+(c12^2+c13^2)/2)*[c12^3 0 2*c12^2*c13 0 c12^2*c13+c12*c13^2 0 2*c12*c13^2 0 c13^3]...
                           +(2*c12*c13)/2*[0 c12^3 0 2*c12^2*c13+c12*c13^2 0 2*c12*c13^2+c12^2*c13 0 c13^3 0];
AA(14).frag(4).prediction =(0.5+(c12^2+c13^2)/2)*[c12^3 0 2*c12^2*c13 0 c12^2*c13+c12*c13^2 0 2*c12*c13^2 0 c13^3]...
                           +(2*c12*c13)/2*[0 c12^3 0 2*c12^2*c13+c12*c13^2 0 2*c12*c13^2+c12^2*c13 0 c13^3 0];
AA(14).frag(5).prediction = [c12 0 c13];

%valine
AA(15).frag(1).prediction = [c12^2 0 c12*c13 c12*c13 0 c13^2];
AA(15).frag(2).prediction = [c12^2 0 c12*c13 c12*c13 0 c13^2];
AA(15).frag(3).prediction = [c12^2 0 2*c12*c13 0 c13^2];
AA(15).frag(4).prediction = [c12^2 0 2*c12*c13 0 c13^2];
AA(15).frag(5).prediction = [c12 0 c13];


