totalacc = zeros(2,4);
incmat=[];
cormat=[];
incs=[];
numslices = 12;
testexamples=ANDexamplesextra;
for i=1:length(testexamples)
    'AND' 
    i
    example = testexamples{i};
    strokerelation = ANDextrastrokerelations{i};
    [accuracy, incpercentmatrix,corpercentmatrix]=identifystrokes( example, strokerelation, numslices, ANDlentemplate3);
    totalacc=totalacc+accuracy;
    if(sum(accuracy(1,:))<sum(accuracy(2,:)))
        incs=[incs i];
    end
    incmat = [incmat;incpercentmatrix];
    cormat = [cormat;corpercentmatrix];
    %NANDintervals(i,:) = startintervalscale(2,:);
    %NANDscales(i,:) = startintervalscale(3,:);
end
incs=[incs 0];
testexamples=NANDexamplesextra;
for i=1:length(testexamples)
    'NAND' 
    i
    example = testexamples{i};
    strokerelation = NANDextrastrokerelations{i};
    [accuracy, incpercentmatrix,corpercentmatrix]=identifystrokes( example, strokerelation, numslices, NANDlentemplate3);
    totalacc=totalacc+accuracy;
    if(sum(accuracy(1,:))<sum(accuracy(2,:)))
        incs=[incs i];
    end
    incmat = [incmat;incpercentmatrix];
    cormat = [cormat;corpercentmatrix];
    %NANDintervals(i,:) = startintervalscale(2,:);
    %NANDscales(i,:) = startintervalscale(3,:);
end
incs=[incs 0];
testexamples=ORexamplesextra;
for i=1:length(testexamples)
    'OR' 
    i
    example = testexamples{i};
    strokerelation = ORextrastrokerelations{i};
    [accuracy, incpercentmatrix,corpercentmatrix]=identifystrokes( example, strokerelation, numslices, ORlentemplate3);
    totalacc=totalacc+accuracy;
    if(sum(accuracy(1,:))<sum(accuracy(2,:)))
        incs=[incs i];
    end
    incmat = [incmat;incpercentmatrix];
    cormat = [cormat;corpercentmatrix];
    %NANDintervals(i,:) = startintervalscale(2,:);
    %NANDscales(i,:) = startintervalscale(3,:);
end
incs=[incs 0];
testexamples=NORexamplesextra;
for i=1:length(testexamples)
    'NOR' 
    i
    example = testexamples{i};
    strokerelation = NORextrastrokerelations{i};
    [accuracy, incpercentmatrix,corpercentmatrix]=identifystrokes( example, strokerelation, numslices, NORlentemplate3);
    totalacc=totalacc+accuracy;
    if(sum(accuracy(1,:))<sum(accuracy(2,:)))
        incs=[incs i];
    end
    incmat = [incmat;incpercentmatrix];
    cormat = [cormat;corpercentmatrix];
    %NANDintervals(i,:) = startintervalscale(2,:);
    %NANDscales(i,:) = startintervalscale(3,:);
end
incs=[incs 0];
testexamples=NOTexamplesextra;
for i=1:length(testexamples)
    'NOT' 
    i
    example = testexamples{i};
    strokerelation = NOTextrastrokerelations{i};
    [accuracy, incpercentmatrix,corpercentmatrix]=identifystrokes( example, strokerelation, numslices, NOTlentemplate3);
    totalacc=totalacc+accuracy;
    if(sum(accuracy(1,:))<sum(accuracy(2,:)))
        incs=[incs i];
    end
    incmat = [incmat;incpercentmatrix];
    cormat = [cormat;corpercentmatrix];
    %NANDintervals(i,:) = startintervalscale(2,:);
    %NANDscales(i,:) = startintervalscale(3,:);
end
incs=[incs 0];
testexamples=XORexamplesextra;
for i=1:length(testexamples)
    'XOR' 
    i
    example = testexamples{i};
    strokerelation = XORextrastrokerelations{i};
    [accuracy, incpercentmatrix,corpercentmatrix]=identifystrokes( example, strokerelation, numslices, XORlentemplate3);
    totalacc=totalacc+accuracy;
    if(sum(accuracy(1,:))<sum(accuracy(2,:)))
        incs=[incs i];
    end
    incmat = [incmat;incpercentmatrix];
    cormat = [cormat;corpercentmatrix];
    %NANDintervals(i,:) = startintervalscale(2,:);
    %NANDscales(i,:) = startintervalscale(3,:);
end
totalacc
incs
