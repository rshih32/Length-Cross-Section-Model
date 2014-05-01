function [ matcherror,matchstartintervalscale ] = matchlentemplatesiterate( querytemplate, fullrotationtemplates )
%MATCHLENTEMPLATES Summary of this function goes here
%   Detailed explanation goes here
x = find(any(querytemplate,2),1,'first'):find(any(querytemplate,2),1,'last');
y = find(any(querytemplate),1,'first'):find(any(querytemplate),1,'last');
querytemplate = querytemplate(x, y);


[fullrowdim,fullcoldim, numrotations] = size(fullrotationtemplates);
matcherror = zeros(1,numrotations);
matchstartintervalscale = zeros(3,numrotations);
[numslices,querycoldim] = size(querytemplate);
for rotation = 1: numrotations
    rotation
    besterror = bitmax;
    template = fullrotationtemplates(:,:,rotation);
    x = find(any(template,2),1,'first'):find(any(template,2),1,'last');
    y = find(any(template),1,'first'):find(any(template),1,'last');
    trimmedtemplate = template(x, y);
    [rowdim,coldim] = size(trimmedtemplate);
    
    maxinterval = floor(rowdim/numslices);
    newquerytemplate = zeros(numslices, coldim);
    newquerytemplate(:,1:querycoldim) = querytemplate;
    queryavg = mean(mean(newquerytemplate));
    
    scales = [1:15]*.3;
    savederror=zeros(length(scales), numslices, rowdim);
    for scalevalue=1:length(scales)
        for theslice=1:numslices
            for therow=1:rowdim
                savederror(scalevalue,theslice,therow)=errmeasure(scales(scalevalue)*newquerytemplate(theslice,:), trimmedtemplate(therow,:));
            end
        end
    end
    
    for scalevalue=1:length(scales)
        
        for interval = 1:maxinterval

            for startpoint = 1:rowdim-interval*numslices+1
                error=0;
                for theslice=1:numslices
                    error=error+savederror(scalevalue, theslice, startpoint+(theslice-1)*interval);
                end
                
                if(error<besterror)
                    besterror = error;
                    matcherror(1,rotation) = besterror;
                    matchstartintervalscale(1,rotation)=startpoint;
                    matchstartintervalscale(2,rotation)=interval;
                    matchstartintervalscale(3,rotation)=scales(scalevalue);
                end
            end
        end
    end
end
end

