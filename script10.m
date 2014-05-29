
fprintf('\n=============== SCRIPT10 ===============\n');



%RUNS
%================================ ELLIPSES ================================
fprintf('Matching ellipses...');

numslices = 12;
%testexamples=ELLIPSEexamples; %COMMENT THIS OUT INSTEAD, change to extra, missing, etc
testexamples=ELLIPSEexamples3;  %ADD FOR IMPERFECT EXAMPLES
strokerelations = ELLIPSEstrokerelations; %ADD FOR IMPERFECT EXAMPLES
ranks=zeros(5,5);
acc1=zeros(2,4);
acc2=zeros(2,4);
ELLIPSEacc=zeros(2,4);
for i=1:length(testexamples)
    %'ELLIPSE' 
    %i
    accall = zeros(2,4,5);
    example = testexamples{i};
    strokerelation = strokerelations{i}; % NEED FOR IMPERFECT EXAMPLES
    %strokerelation = zeros(1,length(example));
    
    % DON'T NEED THIS BECAUSE FILES ALREADY TELL WHICH STROKES ARE MISSING
    %strokerelation( ceil(rand(1)*length(example))) = -1;
    
    classresults=zeros(1,5);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ELLIPSEtemplate);
    classresults(1) = classresult;
    accall(:,:,1) = accuracy;[
    accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ARROWtemplate);
    classresults(2) = classresult;
    accall(:,:,2) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, BOXtemplate);
    classresults(3) = classresult;
    accall(:,:,3) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, LINEtemplate);
    classresults(4) = classresult;
    accall(:,:,4) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, POLYLINEtemplate);
    classresults(5) = classresult;
    accall(:,:,5) = accuracy;
   
    
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:5
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
    
    acc1=acc1+accall(:,:,IX(5));
    tempacc=accall(:,:,IX(5));
    if(sum(accall(1,:,IX(4))) > sum(accall(1,:,IX(5))))
        tempacc=accall(:,:,IX(4));
    end
    acc2=acc2+tempacc;
    ELLIPSEacc = ELLIPSEacc + accall(:,:,1);
end
ELLIPSEranks3=ranks;
ELLIPSEacc1 = acc1;
ELLIPSEacc2 = acc2;
fprintf('...success\n\n');





%================================ ARROWS ==================================
fprintf('Matching arrows...');

numslices = 12;
%testexamples=ARROWexamples; %COMMENT THIS OUT INSTEAD, change to extra, missing, etc
testexamples=ARROWexamples3;  %ADD FOR IMPERFECT EXAMPLES
strokerelations = ARROWstrokerelations; %ADD FOR IMPERFECT EXAMPLES
ranks=zeros(5,5);
acc1=zeros(2,4);
acc2=zeros(2,4);
ARROWacc=zeros(2,4);
for i=1:length(testexamples)
    %'ARROW' 
    %i
    accall = zeros(2,4,5);
    example = testexamples{i};
    strokerelation = strokerelations{i};   %NEED FOR IMPERFECT EXAMPLES
    %strokerelation = zeros(1,length(example));
    
    
    % DON'T NEED THIS BECAUSE FILES ALREADY TELL WHICH STROKES ARE MISSING
    %strokerelation( ceil(rand(1)*length(example))) = -1;
    
    classresults=zeros(1,5);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ELLIPSEtemplate);
    classresults(1) = classresult;
    accall(:,:,1) = accuracy;[
    accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ARROWtemplate);
    classresults(2) = classresult;
    accall(:,:,2) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, BOXtemplate);
    classresults(3) = classresult;
    accall(:,:,3) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, LINEtemplate);
    classresults(4) = classresult;
    accall(:,:,4) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, POLYLINEtemplate);
    classresults(5) = classresult;
    accall(:,:,5) = accuracy;
   
    
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:5
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
    
    acc1=acc1+accall(:,:,IX(5));
    tempacc=accall(:,:,IX(5));
    if(sum(accall(1,:,IX(4))) > sum(accall(1,:,IX(5))))
        tempacc=accall(:,:,IX(4));
    end
    acc2=acc2+tempacc;
    ARROWacc = ARROWacc + accall(:,:,1);
end
ARROWranks3=ranks;
ARROWacc1 = acc1;
ARROWacc2 = acc2;
fprintf('...success\n\n');







%================================ BOXES ================================
fprintf('Matching boxes...');

numslices = 12;
%testexamples=BOXexamples; %COMMENT THIS OUT INSTEAD, change to extra, missing, etc
testexamples=BOXexamples3;  %ADD FOR IMPERFECT EXAMPLES
strokerelations = BOXstrokerelations; %ADD FOR IMPERFECT EXAMPLES
ranks=zeros(5,5);
acc1=zeros(2,4);
acc2=zeros(2,4);
BOXacc=zeros(2,4);
for i=1:length(testexamples)
    %'BOX' 
    %i
    accall = zeros(2,4,5);
    example = testexamples{i};
    strokerelation = strokerelations{i};  %NEED FOR IMPERFECT EXAMPLES
    %strokerelation = zeros(1,length(example));
    
    % DON'T NEED THIS BECAUSE FILES ALREADY TELL WHICH STROKES ARE MISSING
    %strokerelation( ceil(rand(1)*length(example))) = -1;
    
    classresults=zeros(1,5);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ELLIPSEtemplate);
    classresults(1) = classresult;
    accall(:,:,1) = accuracy;[
    accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ARROWtemplate);
    classresults(2) = classresult;
    accall(:,:,2) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, BOXtemplate);
    classresults(3) = classresult;
    accall(:,:,3) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, LINEtemplate);
    classresults(4) = classresult;
    accall(:,:,4) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, POLYLINEtemplate);
    classresults(5) = classresult;
    accall(:,:,5) = accuracy;
   
    
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:5
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
    
    acc1=acc1+accall(:,:,IX(5));
    tempacc=accall(:,:,IX(5));
    if(sum(accall(1,:,IX(4))) > sum(accall(1,:,IX(5))))
        tempacc=accall(:,:,IX(4));
    end
    acc2=acc2+tempacc;
    BOXacc = BOXacc + accall(:,:,1);
end
BOXranks3=ranks;
BOXacc1 = acc1;
BOXacc2 = acc2;
fprintf('...success\n\n');




%================================ LINES ================================
fprintf('Matching lines...');

numslices = 12;
%testexamples=LINEexamples; %COMMENT THIS OUT INSTEAD, change to extra, missing, etc
testexamples=LINEexamples3;  % ADD FOR IMPERFECT EXAMPLES
strokerelations = LINEstrokerelations; % ADD FOR IMPERFECT EXAMPLES
ranks=zeros(5,5);
acc1=zeros(2,4);
acc2=zeros(2,4);
LINEacc=zeros(2,4);
for i=1:length(testexamples)
    %'LINE' 
    %i
    accall = zeros(2,4,5);
    example = testexamples{i};
    strokerelation = strokerelations{i}; % NEED FOR IMPERFECT EXAMPLES
    %strokerelation = zeros(1,length(example));
    
    % DON'T NEED THIS BECAUSE FILES ALREADY TELL WHICH STROKES ARE MISSING
    %strokerelation( ceil(rand(1)*length(example))) = -1;
    
    classresults=zeros(1,5);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ELLIPSEtemplate);
    classresults(1) = classresult;
    accall(:,:,1) = accuracy;[
    accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ARROWtemplate);
    classresults(2) = classresult;
    accall(:,:,2) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, BOXtemplate);
    classresults(3) = classresult;
    accall(:,:,3) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, LINEtemplate);
    classresults(4) = classresult;
    accall(:,:,4) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, POLYLINEtemplate);
    classresults(5) = classresult;
    accall(:,:,5) = accuracy;
   
    
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:5
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
    
    acc1=acc1+accall(:,:,IX(5));
    tempacc=accall(:,:,IX(5));
    if(sum(accall(1,:,IX(4))) > sum(accall(1,:,IX(5))))
        tempacc=accall(:,:,IX(4));
    end
    acc2=acc2+tempacc;
    LINEacc = LINEacc + accall(:,:,1);
end
LINEranks3=ranks;
LINEacc1 = acc1;
LINEacc2 = acc2;
fprintf('...success\n\n');



%================================ POLYLINE ================================
fprintf('Matching polylines...');

numslices = 12;
%testexamples=POLYLINEexamples; %COMMENT THIS OUT INSTEAD, change to extra, missing, etc
testexamples=POLYLINEexamples3;  %ADD FOR IMPERFECT EXAMPLES
strokerelations = POLYLINEstrokerelations;  %ADD FOR IMPERFECT EXAMPLES
ranks=zeros(5,5);
acc1=zeros(2,4);
acc2=zeros(2,4);
POLYLINEacc=zeros(2,4);
for i=1:length(testexamples)
    %'POLYLINE' 
    %i
    accall = zeros(2,4,5);
    example = testexamples{i};
    strokerelation = strokerelations{i};    %NEED FOR IMPERFECT EXAMPLES
    %strokerelation = zeros(1,length(example));
    
    % DON'T NEED THIS BECAUSE FILES ALREADY TELL WHICH STROKES ARE MISSING
    %strokerelation( ceil(rand(1)*length(example))) = -1;
    
    classresults=zeros(1,5);
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ELLIPSEtemplate);
    classresults(1) = classresult;
    accall(:,:,1) = accuracy;[
    accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, ARROWtemplate);
    classresults(2) = classresult;
    accall(:,:,2) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, BOXtemplate);
    classresults(3) = classresult;
    accall(:,:,3) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, LINEtemplate);
    classresults(4) = classresult;
    accall(:,:,4) = accuracy;
    [accuracy, incpercentmatrix,corpercentmatrix,classresult]=identifystrokes( example, strokerelation, numslices, POLYLINEtemplate);
    classresults(5) = classresult;
    accall(:,:,5) = accuracy;
    
   
    
    classresults = classresults/max(classresults);
    [B,IX]=sort(classresults);
    for j=1:5
        ranks(IX(j),j)=ranks(IX(j),j)+1;
    end
    
    acc1=acc1+accall(:,:,IX(5));
    tempacc=accall(:,:,IX(5));
    if(sum(accall(1,:,IX(4))) > sum(accall(1,:,IX(5))))
        tempacc=accall(:,:,IX(4));
    end
    acc2=acc2+tempacc;
    POLYLINEacc = POLYLINEacc + accall(:,:,1);
end
POLYLINEranks3=ranks;
POLYLINEacc1 = acc1;
POLYLINEacc2 = acc2;
fprintf('...success\n\n');


    fprintf('- FINISHED -\n\n');