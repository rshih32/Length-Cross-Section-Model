function [ matcherror,matchstartintervalscale ] = matchlentemplates( querytemplate, fullrotationtemplates )
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
    queryavg = mean(mean(newquerytemplate))
    
    
    for interval = 1:maxinterval
        
        for startpoint = 1:rowdim-interval*numslices+1
            matchtemplate = trimmedtemplate(startpoint:interval:startpoint + interval*numslices-1,:);
            matchtemplate = logical(newquerytemplate).*matchtemplate;
            matchavg = mean(mean(matchtemplate));
            
            matchtemplate = matchtemplate*queryavg/matchavg;
            
            %error=norm(matchtemplate-newquerytemplate,2);
            error=sum(sum(abs(matchtemplate-newquerytemplate)));
            if(error<besterror)
                besterror = error;
                matcherror(1,rotation) = besterror;
                matchstartintervalscale(1,rotation)=startpoint;
                matchstartintervalscale(2,rotation)=interval;
                matchstartintervalscale(3,rotation)=queryavg/matchavg;
            end
        end
    end
end
end

