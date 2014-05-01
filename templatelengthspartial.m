function [ lengthtemplate ] = templatelengthspartial( example,numslices )
%TEMPLATELENGTHS Summary of this function goes here
%   Detailed explanation goes here
    
    x = find(any(example,2),1,'first'):find(any(example,2),1,'last');
    y = find(any(example),1,'first'):find(any(example),1,'last');
    trimmedexample = example(x, y);
    temptemplate = templatelengths( trimmedexample );
    
    x = find(any(temptemplate,2),1,'first'):find(any(temptemplate,2),1,'last');
    y = find(any(temptemplate),1,'first'):find(any(temptemplate),1,'last');
    trimmedtemplate = temptemplate(x, y);
    [rowdim,coldim] = size(trimmedtemplate);
    lengthtemplate = trimmedtemplate(1:round(rowdim/numslices):rowdim,:);

end

