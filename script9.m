
numslices = 12;
testexamples=ANDexamples3;
strokerelations = ANDextrastrokerelations;
ranks=zeros(6,6);
for i=41:length(testexamples)
    'AND' 
    i
    example = testexamples{i};
    %strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    classresults=zeros(1,6);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    classresults(1) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    classresults(2) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    classresults(3) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    classresults(4) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    classresults(5) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    classresults(6) = classresult;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
end
ANDranks4=ranks;

testexamples=NANDexamples3;
strokerelations = NANDextrastrokerelations;
ranks=zeros(6,6);
for i=41:length(testexamples)
    'NAND' 
    i
    example = testexamples{i};
   %strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    classresults=zeros(1,6);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    classresults(1) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    classresults(2) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    classresults(3) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    classresults(4) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    classresults(5) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    classresults(6) = classresult;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
end
NANDranks4=ranks;

testexamples=ORexamples3;
strokerelations = ORextrastrokerelations;
ranks=zeros(6,6);
for i=41:length(testexamples)
    'OR' 
    i
    example = testexamples{i};
    %strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    classresults=zeros(1,6);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    classresults(1) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    classresults(2) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    classresults(3) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    classresults(4) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    classresults(5) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    classresults(6) = classresult;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
end
ORranks4=ranks;

testexamples=NORexamples3;
strokerelations = NORextrastrokerelations;
ranks=zeros(6,6);
for i=41:length(testexamples)
    'NOR' 
    i
    example = testexamples{i};
    %strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    classresults=zeros(1,6);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    classresults(1) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    classresults(2) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    classresults(3) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    classresults(4) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    classresults(5) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    classresults(6) = classresult;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
end
NORranks4=ranks;

testexamples=NOTexamples3;
strokerelations = NOTextrastrokerelations;
ranks=zeros(6,6);
for i=41:length(testexamples)
    'NOT' 
    i
    example = testexamples{i};
   %strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    classresults=zeros(1,6);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    classresults(1) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    classresults(2) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    classresults(3) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    classresults(4) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    classresults(5) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    classresults(6) = classresult;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
end
NOTranks4=ranks;

testexamples=XORexamples3;
strokerelations = XORextrastrokerelations;
ranks=zeros(6,6);
for i=41:length(testexamples)
    'XOR' 
    i
    example = testexamples{i};
   %strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    classresults=zeros(1,6);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    classresults(1) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    classresults(2) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    classresults(3) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    classresults(4) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    classresults(5) = classresult;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    classresults(6) = classresult;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
end
XORranks4=ranks;

