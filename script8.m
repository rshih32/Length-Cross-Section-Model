
numslices = 12;
testexamples=ANDexamplesextra;
strokerelations = ANDextrastrokerelations;
ranks=zeros(6,6);
acc1=zeros(2,4);
acc2=zeros(2,4);
for i=1:length(testexamples)
    'AND' 
    i
    accall = zeros(2,4,6);
    example = testexamples{i};
    strokerelation = strokerelations{i};
    classresults=zeros(1,6);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    classresults(1) = classresult;
    accall(:,:,1) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    classresults(2) = classresult;
    accall(:,:,2) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    classresults(3) = classresult;
    accall(:,:,3) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    classresults(4) = classresult;
    accall(:,:,4) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    classresults(5) = classresult;
    accall(:,:,5) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    classresults(6) = classresult;
    accall(:,:,6) = accuracy;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
    
    acc1=acc1+accall(:,:,IX(1));
    tempacc=accall(:,:,IX(1));
    if(sum(accall(1,:,IX(2))) > sum(accall(1,:,IX(1))))
        tempacc=accall(:,:,IX(2));
    end
    acc2=acc2+tempacc;
end
ANDranks3=ranks;

testexamples=NANDexamplesextra;
strokerelations = NANDextrastrokerelations;
ranks=zeros(6,6);
for i=1:length(testexamples)
    'NAND' 
    i
    
    accall = zeros(2,4,6);
    example = testexamples{i};
    strokerelation = strokerelations{i};
    classresults=zeros(1,6);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    classresults(1) = classresult;
    accall(:,:,1) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    classresults(2) = classresult;
    accall(:,:,2) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    classresults(3) = classresult;
    accall(:,:,3) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    classresults(4) = classresult;
    accall(:,:,4) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    classresults(5) = classresult;
    accall(:,:,5) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    classresults(6) = classresult;
    accall(:,:,6) = accuracy;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
    
    acc1=acc1+accall(:,:,IX(1));
    tempacc=accall(:,:,IX(1));
    if(sum(accall(1,:,IX(2))) > sum(accall(1,:,IX(1))))
        tempacc=accall(:,:,IX(2));
    end
    acc2=acc2+tempacc;
end
NANDranks3=ranks;

testexamples=ORexamplesextra;
strokerelations = ORextrastrokerelations;
ranks=zeros(6,6);
for i=1:length(testexamples)
    'OR' 
    
    i
    accall = zeros(2,4,6);
    example = testexamples{i};
    strokerelation = strokerelations{i};
    classresults=zeros(1,6);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    classresults(1) = classresult;
    accall(:,:,1) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    classresults(2) = classresult;
    accall(:,:,2) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    classresults(3) = classresult;
    accall(:,:,3) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    classresults(4) = classresult;
    accall(:,:,4) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    classresults(5) = classresult;
    accall(:,:,5) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    classresults(6) = classresult;
    accall(:,:,6) = accuracy;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
    
    acc1=acc1+accall(:,:,IX(1));
    tempacc=accall(:,:,IX(1));
    if(sum(accall(1,:,IX(2))) > sum(accall(1,:,IX(1))))
        tempacc=accall(:,:,IX(2));
    end
    acc2=acc2+tempacc;
end
ORranks3=ranks;

testexamples=NORexamplesextra;
strokerelations = NORextrastrokerelations;
ranks=zeros(6,6);
for i=1:length(testexamples)
    'NOR' 
    i
    accall = zeros(2,4,6);
    example = testexamples{i};
    strokerelation = strokerelations{i};
    classresults=zeros(1,6);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    classresults(1) = classresult;
    accall(:,:,1) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    classresults(2) = classresult;
    accall(:,:,2) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    classresults(3) = classresult;
    accall(:,:,3) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    classresults(4) = classresult;
    accall(:,:,4) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    classresults(5) = classresult;
    accall(:,:,5) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    classresults(6) = classresult;
    accall(:,:,6) = accuracy;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
    
    acc1=acc1+accall(:,:,IX(1));
    tempacc=accall(:,:,IX(1));
    if(sum(accall(1,:,IX(2))) > sum(accall(1,:,IX(1))))
        tempacc=accall(:,:,IX(2));
    end
    acc2=acc2+tempacc;
end
NORranks3=ranks;

testexamples=NOTexamplesextra;
strokerelations = NOTextrastrokerelations;
ranks=zeros(6,6);
for i=1:length(testexamples)
    'NOT' 
    i
    accall = zeros(2,4,6);
    example = testexamples{i};
    strokerelation = strokerelations{i};
    classresults=zeros(1,6);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    classresults(1) = classresult;
    accall(:,:,1) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    classresults(2) = classresult;
    accall(:,:,2) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    classresults(3) = classresult;
    accall(:,:,3) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    classresults(4) = classresult;
    accall(:,:,4) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    classresults(5) = classresult;
    accall(:,:,5) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    classresults(6) = classresult;
    accall(:,:,6) = accuracy;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
    
    acc1=acc1+accall(:,:,IX(1));
    tempacc=accall(:,:,IX(1));
    if(sum(accall(1,:,IX(2))) > sum(accall(1,:,IX(1))))
        tempacc=accall(:,:,IX(2));
    end
    acc2=acc2+tempacc;
end
NOTranks3=ranks;

testexamples=XORexamplesextra;
strokerelations = XORextrastrokerelations;
ranks=zeros(6,6);
for i=1:length(testexamples)
    'XOR' 
    i
    accall = zeros(2,4,6);
    example = testexamples{i};
    strokerelation = strokerelations{i};
    classresults=zeros(1,6);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    classresults(1) = classresult;
    accall(:,:,1) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    classresults(2) = classresult;
    accall(:,:,2) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    classresults(3) = classresult;
    accall(:,:,3) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    classresults(4) = classresult;
    accall(:,:,4) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    classresults(5) = classresult;
    accall(:,:,5) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    classresults(6) = classresult;
    accall(:,:,6) = accuracy;
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:6
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
    
    acc1=acc1+accall(:,:,IX(1));
    tempacc=accall(:,:,IX(1));
    if(sum(accall(1,:,IX(2))) > sum(accall(1,:,IX(1))))
        tempacc=accall(:,:,IX(2));
    end
    acc2=acc2+tempacc;
end
XORranks3=ranks;

