function [ ] = viewLengthTemplate( lengthtemplate )
%VIEWLENGTHTEMPLATE Summary of this function goes here
%   Detailed explanation goes here
figure;
x = find(any(lengthtemplate,2),1,'first'):find(any(lengthtemplate,2),1,'last');
y = find(any(lengthtemplate),1,'first'):find(any(lengthtemplate),1,'last');
trimmedlengthtemplate = lengthtemplate(x, y);
[rowdim,coldim] = size(trimmedlengthtemplate);

[fullrowdim,fullcoldim] = size(lengthtemplate);
maxsections = 0;
coldim
theimage = zeros(rowdim, fullcoldim, 3);
for i=1:rowdim
    nextpoint=0;
    for j=1:coldim
        if(round(trimmedlengthtemplate(i,j)) > 1)
            nextpoint = nextpoint + round(trimmedlengthtemplate(i,j));
            theimage(i,nextpoint,1) = 1;
            if(j>maxsections)
                maxsections=j;
            end
        end
    end
end
maxsections
image(theimage);
end

