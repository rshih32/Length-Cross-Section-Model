function [ ] = viewMatchedLengthTemplate(querylengthtemplate, lengthtemplate, start, interval, scale)
%VIEWLENGTHTEMPLATE Summary of this function goes here
%   Detailed explanation goes here
figure;
x = find(any(lengthtemplate,2),1,'first'):find(any(lengthtemplate,2),1,'last');
y = find(any(lengthtemplate),1,'first'):find(any(lengthtemplate),1,'last');
trimmedlengthtemplate = lengthtemplate(x, y);

[rowdim,coldim] = size(trimmedlengthtemplate);
padrowdim=int32(rowdim*1.5);
templatestart = int32(rowdim*.25);
templateend = templatestart+rowdim-1;
paddedtemplate = zeros(padrowdim, coldim);
paddedtemplate(templatestart:templateend,:) = trimmedlengthtemplate;
trimmedlengthtemplate=paddedtemplate;


x = find(any(querylengthtemplate,2),1,'first'):find(any(querylengthtemplate,2),1,'last');
y = find(any(querylengthtemplate),1,'first'):find(any(querylengthtemplate),1,'last');
trimmedquerylengthtemplate = querylengthtemplate(x, y)*scale;
[numslices,querycoldim] = size(trimmedquerylengthtemplate);

[rowdim,coldim] = size(trimmedlengthtemplate);

[fullrowdim,fullcoldim] = size(lengthtemplate);
maxsections = 0;

theimage = zeros(rowdim, fullcoldim, 3);

queryindex=1;

for i=1:rowdim
    nextpoint=0;
    nextchange=0;
    color=2;
    if(i>=start && queryindex <=numslices)
        if(mod(i-start,interval)==0)
            
            for j=1:querycoldim
                if(round(trimmedquerylengthtemplate(queryindex,j)) > 1)
                    for point=nextchange+1:nextchange + round(trimmedquerylengthtemplate(queryindex,j))
                        theimage(i,point,color) = 1;
                    end
                    nextchange = nextchange + round(trimmedquerylengthtemplate(queryindex,j));
                    if(color==2)
                        color = 3;
                    else
                        color = 2;
                    end
                end
            end
            queryindex=queryindex + 1;
        end
    end
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

image(theimage);
end

