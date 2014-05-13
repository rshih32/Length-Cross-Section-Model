% 
numslices = 12;
testexamples=ANDexamplesnorm;
% testexamples=ANDexamplesextra;
% strokerelations = ANDextrastrokerelations;
ranks=zeros(6,6);
acc1=zeros(2,4);
acc2=zeros(2,4);
ANDacc=zeros(2,4);
for i=1:5%length(testexamples)
    'AND' 
    i
    accall = zeros(2,4,6);
    example = testexamples{i};
%      strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    
    strokerelation( ceil(rand(1)*length(example))) = -1;
    
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
    
    acc1=acc1+accall(:,:,IX(6));
    tempacc=accall(:,:,IX(6));
    if(sum(accall(1,:,IX(5))) > sum(accall(1,:,IX(6))))
        tempacc=accall(:,:,IX(5));
    end
    acc2=acc2+tempacc;
    ANDacc = ANDacc + accall(:,:,1);
end
ANDranks3=ranks;
ANDacc1 = acc1;
ANDacc2 = acc2;

testexamples=ORexamplesnorm;
% testexamples=ORexamplesextra;
% strokerelations = ORextrastrokerelations;
ranks=zeros(6,6);
acc1=zeros(2,4);
acc2=zeros(2,4);
ORacc=zeros(2,4);
for i=1:5%length(testexamples)
    'OR' 
    i
    accall = zeros(2,4,6);
    example = testexamples{i};
%      strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    
    strokerelation( ceil(rand(1)*length(example))) = -1;
    
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
    
    acc1=acc1+accall(:,:,IX(6));
    tempacc=accall(:,:,IX(6));
    if(sum(accall(1,:,IX(5))) > sum(accall(1,:,IX(6))))
        tempacc=accall(:,:,IX(5));
    end
    acc2=acc2+tempacc;
    ORacc = ORacc + accall(:,:,2);
end
ORranks3=ranks;
ORacc1 = acc1;
ORacc2 = acc2;

testexamples=NANDexamplesnorm;
% testexamples=ANDexamplesextra;
% strokerelations = ANDextrastrokerelations;
ranks=zeros(6,6);
acc1=zeros(2,4);
acc2=zeros(2,4);
NANDacc=zeros(2,4);
for i=1:5%length(testexamples)
    'NAND' 
    i
    accall = zeros(2,4,6);
    example = testexamples{i};
%      strokerelation = strokerelations{i};

   strokerelation = zeros(1,length(example)); 
    strokerelation( ceil(rand(1)*length(example))) = -1;
%      strokerelation=[0,-1,0];
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
    
    acc1=acc1+accall(:,:,IX(6));
    tempacc=accall(:,:,IX(6));
    if(sum(accall(1,:,IX(5))) > sum(accall(1,:,IX(6))))
        tempacc=accall(:,:,IX(5));
    end
    acc2=acc2+tempacc;
    NANDacc = NANDacc + accall(:,:,3);
end
NANDranks3=ranks;
NANDacc1 = acc1;
NANDacc2 = acc2;

testexamples=NORexamplesnorm;
% testexamples=ANDexamplesextra;
% strokerelations = ANDextrastrokerelations;
ranks=zeros(6,6);
acc1=zeros(2,4);
acc2=zeros(2,4);
NORacc=zeros(2,4);
for i=1:5%length(testexamples)
    'NOR' 
    i
    accall = zeros(2,4,6);
    example = testexamples{i};
%      strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    
    strokerelation( ceil(rand(1)*length(example))) = -1;
    
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
    
    acc1=acc1+accall(:,:,IX(6));
    tempacc=accall(:,:,IX(6));
    if(sum(accall(1,:,IX(5))) > sum(accall(1,:,IX(6))))
        tempacc=accall(:,:,IX(5));
    end
    acc2=acc2+tempacc;
    NORacc = NORacc + accall(:,:,4);
end
NORranks3=ranks;
NORacc1 = acc1;
NORacc2 = acc2;
testexamples=NOTexamplesnorm;
% testexamples=ANDexamplesextra;
% strokerelations = ANDextrastrokerelations;
ranks=zeros(6,6);
acc1=zeros(2,4);
acc2=zeros(2,4);
NOTacc=zeros(2,4);
for i=1:5%length(testexamples)
    'NOT' 
    i
    accall = zeros(2,4,6);
    example = testexamples{i};
%      strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    
    strokerelation( ceil(rand(1)*length(example))) = -1;
    
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
    
    acc1=acc1+accall(:,:,IX(6));
    tempacc=accall(:,:,IX(6));
    if(sum(accall(1,:,IX(5))) > sum(accall(1,:,IX(6))))
        tempacc=accall(:,:,IX(5));
    end
    acc2=acc2+tempacc;
    NOTacc = NOTacc + accall(:,:,5);
end
NOTranks3=ranks;
NOTacc1 = acc1;
NOTacc2 = acc2;
testexamples=XORexamplesnorm;
% testexamples=ANDexamplesextra;
% strokerelations = ANDextrastrokerelations;
ranks=zeros(6,6);
acc1=zeros(2,4);
acc2=zeros(2,4);
XORacc=zeros(2,4);
for i=1:5%length(testexamples)
    'XOR' 
    i
    accall = zeros(2,4,6);
    example = testexamples{i};
%      strokerelation = strokerelations{i};
    strokerelation = zeros(1,length(example));
    
    strokerelation( ceil(rand(1)*length(example))) = -1;
    
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
    
    acc1=acc1+accall(:,:,IX(6));
    tempacc=accall(:,:,IX(6));
    if(sum(accall(1,:,IX(5))) > sum(accall(1,:,IX(6))))
        tempacc=accall(:,:,IX(5));
    end
    acc2=acc2+tempacc;
    XORacc = XORacc + accall(:,:,6);
end
XORranks3=ranks;
XORacc1 = acc1;
XORacc2 = acc2;

