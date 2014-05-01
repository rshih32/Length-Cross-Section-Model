% 
% testexamples=ANDexamplesextra;
% ranks=zeros(6,6);
% for i=1:length(testexamples)
%     'AND' 
%     i
%     example = testexamples{i};
%     %strokerelation = strokerelations{i};
%     strokerelation = zeros(1,length(example));
%     classresults=zeros(1,6);
%     classresult=ouyang.comparefeaturegridrotation( example, ANDtrainingfeaturegrids );
%     'and'
%     classresults(1) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, ORtrainingfeaturegrids );
%     'or'
%     classresults(2) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NANDtrainingfeaturegrids );
%     'nand'
%     classresults(3) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NORtrainingfeaturegrids );
%     'nor'
%     classresults(4) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NOTtrainingfeaturegrids );
%     'not'
%     classresults(5) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, XORtrainingfeaturegrids );
%     'xor'
%     classresults(6) = classresult;
%     classresults = classresults/max(classresults);
%     [B,IX]=sort(classresults);
%     for j=1:6
%         ranks(IX(j),j)=ranks(IX(j),j)+1;
%     end
% end
% ANDranks2=ranks;
% 
% testexamples=NANDexamplesextra;
% ranks=zeros(6,6);
% for i=1:length(testexamples)
%     'NAND' 
%     i
%     example = testexamples{i};
%     %strokerelation = strokerelations{i};
%     strokerelation = zeros(1,length(example));
%     classresults=zeros(1,6);
%     classresult=ouyang.comparefeaturegridrotation( example, ANDtrainingfeaturegrids );
%     'and'
%     classresults(1) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, ORtrainingfeaturegrids );
%     'or'
%     classresults(2) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NANDtrainingfeaturegrids );
%     'nand'
%     classresults(3) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NORtrainingfeaturegrids );
%     'nor'
%     classresults(4) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NOTtrainingfeaturegrids );
%     'not'
%     classresults(5) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, XORtrainingfeaturegrids );
%     'xor'
%     classresults(6) = classresult;
%     classresults = classresults/max(classresults);
%     [B,IX]=sort(classresults);
%     for j=1:6
%         ranks(IX(j),j)=ranks(IX(j),j)+1;
%     end
% end
% NANDranks2=ranks;
% 
% testexamples=ORexamplesextra;
% ranks=zeros(6,6);
% for i=1:length(testexamples)
%     'OR' 
%     i
%     example = testexamples{i};
%     %strokerelation = strokerelations{i};
%     strokerelation = zeros(1,length(example));
%     classresults=zeros(1,6);
%     classresult=ouyang.comparefeaturegridrotation( example, ANDtrainingfeaturegrids );
%     'and'
%     classresults(1) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, ORtrainingfeaturegrids );
%     'or'
%     classresults(2) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NANDtrainingfeaturegrids );
%     'nand'
%     classresults(3) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NORtrainingfeaturegrids );
%     'nor'
%     classresults(4) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NOTtrainingfeaturegrids );
%     'not'
%     classresults(5) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, XORtrainingfeaturegrids );
%     'xor'
%     classresults(6) = classresult;
%     classresults = classresults/max(classresults);
%     [B,IX]=sort(classresults);
%     for j=1:6
%         ranks(IX(j),j)=ranks(IX(j),j)+1;
%     end
% end
% ORranks2=ranks;
% 
% testexamples=NORexamplesextra;
% ranks=zeros(6,6);
% for i=1:length(testexamples)
%     'NOR' 
%     i
%     example = testexamples{i};
%     %strokerelation = strokerelations{i};
%     strokerelation = zeros(1,length(example));
%     classresults=zeros(1,6);
%     classresult=ouyang.comparefeaturegridrotation( example, ANDtrainingfeaturegrids );
%     'and'
%     classresults(1) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, ORtrainingfeaturegrids );
%     'or'
%     classresults(2) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NANDtrainingfeaturegrids );
%     'nand'
%     classresults(3) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NORtrainingfeaturegrids );
%     'nor'
%     classresults(4) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NOTtrainingfeaturegrids );
%     'not'
%     classresults(5) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, XORtrainingfeaturegrids );
%     'xor'
%     classresults(6) = classresult;
%     classresults = classresults/max(classresults);
%     [B,IX]=sort(classresults);
%     for j=1:6
%         ranks(IX(j),j)=ranks(IX(j),j)+1;
%     end
% end
% NORranks2=ranks;

% testexamples=NOTexamplesextra;
% ranks=zeros(6,6);
% for i=1:length(testexamples)
%     'NOT' 
%     i
%     example = testexamples{i};
%     %strokerelation = strokerelations{i};
%     strokerelation = zeros(1,length(example));
%     classresults=zeros(1,6);
%     classresult=ouyang.comparefeaturegridrotation( example, ANDtrainingfeaturegrids );
%     'and'
%     classresults(1) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, ORtrainingfeaturegrids );
%     'or'
%     classresults(2) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NANDtrainingfeaturegrids );
%     'nand'
%     classresults(3) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NORtrainingfeaturegrids );
%     'nor'
%     classresults(4) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NOTtrainingfeaturegrids );
%     'not'
%     classresults(5) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, XORtrainingfeaturegrids );
%     'xor'
%     classresults(6) = classresult;
%     classresults = classresults/max(classresults);
%     [B,IX]=sort(classresults);
%     for j=1:6
%         ranks(IX(j),j)=ranks(IX(j),j)+1;
%     end
% end
% NOTranks2=ranks;
% 
% testexamples=XORexamplesextra;
% ranks=zeros(6,6);
% for i=1:length(testexamples)
%     'XOR' 
%     i
%     example = testexamples{i};
%     %strokerelation = strokerelations{i};
%     strokerelation = zeros(1,length(example));
%     classresults=zeros(1,6);
%     classresult=ouyang.comparefeaturegridrotation( example, ANDtrainingfeaturegrids );
%     'and'
%     classresults(1) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, ORtrainingfeaturegrids );
%     'or'
%     classresults(2) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NANDtrainingfeaturegrids );
%     'nand'
%     classresults(3) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NORtrainingfeaturegrids );
%     'nor'
%     classresults(4) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NOTtrainingfeaturegrids );
%     'not'
%     classresults(5) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, XORtrainingfeaturegrids );
%     'xor'
%     classresults(6) = classresult;
%     classresults = classresults/max(classresults);
%     [B,IX]=sort(classresults);
%     for j=1:6
%         ranks(IX(j),j)=ranks(IX(j),j)+1;
%     end
% end
% XORranks2=ranks;
% 
% 
% Inputexamples = ANDexamples3;
% testexamples=Inputexamples(int32(length(Inputexamples))/10:length(Inputexamples));
% ranks=zeros(6,6);
% for i=1:300%length(testexamples)
%     'AND' 
%     i
%     example = testexamples{i};
%     %strokerelation = strokerelations{i};
%     strokerelation = zeros(1,length(example));
%     classresults=zeros(1,6);
%     classresult=ouyang.comparefeaturegridrotation( example, ANDtrainingfeaturegrids );
%     'and'
%     classresults(1) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, ORtrainingfeaturegrids );
%     'or'
%     classresults(2) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NANDtrainingfeaturegrids );
%     'nand'
%     classresults(3) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NORtrainingfeaturegrids );
%     'nor'
%     classresults(4) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NOTtrainingfeaturegrids );
%     'not'
%     classresults(5) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, XORtrainingfeaturegrids );
%     'xor'
%     classresults(6) = classresult;
%     classresults = classresults/max(classresults);
%     [B,IX]=sort(classresults);
%     for j=1:6
%         ranks(IX(j),j)=ranks(IX(j),j)+1;
%     end
% end
% ANDranks=ranks;
% 
% Inputexamples = NANDexamples3;
% testexamples=Inputexamples(int32(length(Inputexamples))/10:length(Inputexamples));
% ranks=zeros(6,6);
% for i=1:300%length(testexamples)
%     'NAND' 
%     i
%     example = testexamples{i};
%     %strokerelation = strokerelations{i};
%     strokerelation = zeros(1,length(example));
%     classresults=zeros(1,6);
%     classresult=ouyang.comparefeaturegridrotation( example, ANDtrainingfeaturegrids );
%     'and'
%     classresults(1) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, ORtrainingfeaturegrids );
%     'or'
%     classresults(2) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NANDtrainingfeaturegrids );
%     'nand'
%     classresults(3) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NORtrainingfeaturegrids );
%     'nor'
%     classresults(4) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NOTtrainingfeaturegrids );
%     'not'
%     classresults(5) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, XORtrainingfeaturegrids );
%     'xor'
%     classresults(6) = classresult;
%     classresults = classresults/max(classresults);
%     [B,IX]=sort(classresults);
%     for j=1:6
%         ranks(IX(j),j)=ranks(IX(j),j)+1;
%     end
% end
% NANDranks=ranks;
% 
% Inputexamples = ORexamples3;
% testexamples=Inputexamples(int32(length(Inputexamples))/10:length(Inputexamples));
% ranks=zeros(6,6);
% for i=1:300%length(testexamples)
%     'OR' 
%     i
%     example = testexamples{i};
%     %strokerelation = strokerelations{i};
%     strokerelation = zeros(1,length(example));
%     classresults=zeros(1,6);
%     classresult=ouyang.comparefeaturegridrotation( example, ANDtrainingfeaturegrids );
%     'and'
%     classresults(1) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, ORtrainingfeaturegrids );
%     'or'
%     classresults(2) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NANDtrainingfeaturegrids );
%     'nand'
%     classresults(3) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NORtrainingfeaturegrids );
%     'nor'
%     classresults(4) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NOTtrainingfeaturegrids );
%     'not'
%     classresults(5) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, XORtrainingfeaturegrids );
%     'xor'
%     classresults(6) = classresult;
%     classresults = classresults/max(classresults);
%     [B,IX]=sort(classresults);
%     for j=1:6
%         ranks(IX(j),j)=ranks(IX(j),j)+1;
%     end
% end
% ORranks=ranks;
% 
% Inputexamples = NORexamples3;
% testexamples=Inputexamples(int32(length(Inputexamples))/10:length(Inputexamples));
% ranks=zeros(6,6);
% for i=1:300%length(testexamples)
%     'NOR' 
%     i
%     example = testexamples{i};
%     %strokerelation = strokerelations{i};
%     strokerelation = zeros(1,length(example));
%     classresults=zeros(1,6);
%     classresult=ouyang.comparefeaturegridrotation( example, ANDtrainingfeaturegrids );
%     'and'
%     classresults(1) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, ORtrainingfeaturegrids );
%     'or'
%     classresults(2) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NANDtrainingfeaturegrids );
%     'nand'
%     classresults(3) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NORtrainingfeaturegrids );
%     'nor'
%     classresults(4) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, NOTtrainingfeaturegrids );
%     'not'
%     classresults(5) = classresult;
%     classresult=ouyang.comparefeaturegridrotation( example, XORtrainingfeaturegrids );
%     'xor'
%     classresults(6) = classresult;
%     classresults = classresults/max(classresults);
%     [B,IX]=sort(classresults);
%     for j=1:6
%         ranks(IX(j),j)=ranks(IX(j),j)+1;
%     end
% end
% NORranks=ranks;

Inputexamples = NOTexamples3;
testexamples=Inputexamples(int32(length(Inputexamples))/10:length(Inputexamples));
ranks=zeros(6,6);
for i=1:300%length(testexamples)
    'NOT' 
    i
    example = testexamples{i};
    %strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    classresults=zeros(1,6);
    classresult=ouyang.comparefeaturegridrotation( example, ANDtrainingfeaturegrids );
    'and'
    classresults(1) = classresult;
    classresult=ouyang.comparefeaturegridrotation( example, ORtrainingfeaturegrids );
    'or'
    classresults(2) = classresult;
    classresult=ouyang.comparefeaturegridrotation( example, NANDtrainingfeaturegrids );
    'nand'
    classresults(3) = classresult;
    classresult=ouyang.comparefeaturegridrotation( example, NORtrainingfeaturegrids );
    'nor'
    classresults(4) = classresult;
    classresult=ouyang.comparefeaturegridrotation( example, NOTtrainingfeaturegrids );
    'not'
    classresults(5) = classresult;
    classresult=ouyang.comparefeaturegridrotation( example, XORtrainingfeaturegrids );
    'xor'
    classresults(6) = classresult;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
end
NOTranks=ranks;

Inputexamples = XORexamples3;
testexamples=Inputexamples(int32(length(Inputexamples))/10:length(Inputexamples));
ranks=zeros(6,6);
for i=1:300%length(testexamples)
    'XOR' 
    i
    example = testexamples{i};
    %strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    classresults=zeros(1,6);
    classresult=ouyang.comparefeaturegridrotation( example, ANDtrainingfeaturegrids );
    'and'
    classresults(1) = classresult;
    classresult=ouyang.comparefeaturegridrotation( example, ORtrainingfeaturegrids );
    'or'
    classresults(2) = classresult;
    classresult=ouyang.comparefeaturegridrotation( example, NANDtrainingfeaturegrids );
    'nand'
    classresults(3) = classresult;
    classresult=ouyang.comparefeaturegridrotation( example, NORtrainingfeaturegrids );
    'nor'
    classresults(4) = classresult;
    classresult=ouyang.comparefeaturegridrotation( example, NOTtrainingfeaturegrids );
    'not'
    classresults(5) = classresult;
    classresult=ouyang.comparefeaturegridrotation( example, XORtrainingfeaturegrids );
    'xor'
    classresults(6) = classresult;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
end
XORranks=ranks;
