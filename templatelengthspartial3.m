function [ lengthtemplate, fulllengthtemplate, strokeidentifier ] = templatelengthspartial3( example, fullexample, numslices, strokerelation )
%TEMPLATELENGTHS Summary of this function goes here
%   Detailed explanation goes here
    
    

    x = find(any(example,2),1,'first'):find(any(example,2),1,'last');
    y = find(any(example),1,'first'):find(any(example),1,'last');
    trimmedexample = example(x, y);
    
    minx=min(x);
    maxx=max(x);
    [rowdim,coldim] = size(trimmedexample);
    lengthinterval = rowdim/(numslices+2);
    %the very edges tend to be points so move the pieces in a bit.
    trimmedexample = trimmedexample(round(1+lengthinterval:lengthinterval:rowdim-lengthinterval),:);
    
%     [rowdim,coldim]=size(trimmedexample);
%     test=zeros(rowdim,coldim,3);
%     test(:,:,1) = trimmedexample;
%     figure;
%     image(logical(test));
    
    [lengthtemplate,tempstrokeidentifier] = templatelengthsidentified( trimmedexample, strokerelation );
    lengthtemplate(:,all(lengthtemplate==0,1))=[];
    
    trimmedfullexample = fullexample(minx:maxx,:);
     x = find(any(trimmedfullexample,2),1,'first'):find(any(trimmedfullexample,2),1,'last');
    y = find(any(trimmedfullexample),1,'first'):find(any(trimmedfullexample),1,'last');
    trimmedfullexample = trimmedfullexample(x, y);
    trimmedfullexample = trimmedfullexample(round(1+lengthinterval:lengthinterval:rowdim-lengthinterval),:);
    
    [fulllengthtemplate,strokeidentifier] = templatelengthsidentified( trimmedfullexample, strokerelation );
    fulllengthtemplate(:,all(fulllengthtemplate==0,1))=[];
    strokeidentifier(:,all(strokeidentifier==0,1))=[];
  

end

