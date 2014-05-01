function [ ] = viewLengthTemplateClassified( lengthtemplate, classifications )
%VIEWLENGTHTEMPLATE Summary of this function goes here
%   Detailed explanation goes here
figure;
[rowdim,coldim] = size(lengthtemplate);

fullcoldim=max(sum(lengthtemplate, 2))+1;
maxsections = 0;
coldim
theimage = zeros(rowdim, fullcoldim, 3);

for i=1:rowdim
    nextpoint=0;
    relation=classifications(i,1);
    if relation == -1
        %red for missing
        theimage(i,1,1) = 1;
    elseif relation == 1
        %green for extra
        theimage(i,1,2) = 1;
    elseif relation == 0
        %blue for correct
        theimage(i,1,3) = 1;
    else
        %white for other strokes
        theimage(i,1,1) = 1;
        theimage(i,1,2) = 1;
        theimage(i,1,3) = 1;
    end
    for j=1:coldim
        if(round(lengthtemplate(i,j)) > 1)
            nextpoint = nextpoint + round(lengthtemplate(i,j));
            
            relation=classifications(i,j+1);
            if relation == -1
                %red for missing
                theimage(i,nextpoint,1) = 1;
            elseif relation == 1
                %green for extra
                theimage(i,nextpoint,2) = 1;
            elseif relation == 0
                %blue for correct
                theimage(i,nextpoint,3) = 1;
            else
                %white for other strokes
                theimage(i,nextpoint,1) = 1;
                theimage(i,nextpoint,2) = 1;
                theimage(i,nextpoint,3) = 1;
            end
            if(j>maxsections)
                maxsections=j;
            end
        end
    end
end
maxsections
image(theimage);
end

