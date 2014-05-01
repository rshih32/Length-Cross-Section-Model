function [ lengthtemplate, strokeidentifier ] = templatelengthspartial2( example, numslices )
%TEMPLATELENGTHS Summary of this function goes here
%   Detailed explanation goes here
    
    x = find(any(example,2),1,'first'):find(any(example,2),1,'last');
    y = find(any(example),1,'first'):find(any(example),1,'last');
    trimmedexample = example(x, y);
    
    [temptemplate,tempstrokeidentifier] = templatelengths( trimmedexample );
    
    x = find(any(temptemplate,2),1,'first'):find(any(temptemplate,2),1,'last');
    y = find(any(temptemplate),1,'first'):find(any(temptemplate),1,'last');
    trimmedtemplate = temptemplate(x, y);
    [rowdim,coldim] = size(trimmedtemplate);
    lengthtemplate = trimmedtemplate(1:round(rowdim/numslices):rowdim,:);
    
    x = find(any(tempstrokeidentifier,2),1,'first'):find(any(tempstrokeidentifier,2),1,'last');
    y = find(any(tempstrokeidentifier),1,'first'):find(any(tempstrokeidentifier),1,'last');
    trimmedstrokeidentifier = tempstrokeidentifier(x, y);
    [rowdim,coldim] = size(trimmedstrokeidentifier);
    strokeidentifier = trimmedstrokeidentifier(1:round(rowdim/numslices):rowdim,:);
    

end

