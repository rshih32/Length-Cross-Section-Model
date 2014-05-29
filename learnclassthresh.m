function [Hthreshholds, Vthreshholds] = learnclassthresh(examples, fulltemplates, numfilters)
    Hthreshholds = ones(1,numfilters)*bitmax;
    Vthreshholds = ones(1,numfilters)*bitmax;
    stdv=50;
    templatedim=300;
    [Hfilters,Vfilters] = parsing.genfilterssimple(fulltemplates,numfilters);
    
    [iO,jO,sO] = find(sparse(ones(templatedim,templatedim)));
    templatedimensions = [iO,jO];
  
    numrotations = 18;
    
    index=1;
    %fill the rest
    for i=1:length(examples)
        i
        
        rawstrokes=examples{i};
        bestHThresh = zeros(1,numfilters);
        bestVThresh = zeros(1,numfilters);
        for rotation=1:numrotations
            %rotation
            example = zeros(templatedim,templatedim,3);
            %for all angles
            angle = 2*pi/numrotations;

            Rotate = [cos(angle), -sin(angle); sin(angle),cos(angle)];
            for j = 1: length(rawstrokes)
                rawstroke = rawstrokes{j};
                rawstroke = Rotate * rawstroke;

                rawstrokes{j} = rawstroke;
            end
            temp = parsing.fill(rawstrokes);
            xfilled = temp(1,:);
            yfilled = temp(2,:);
            standevx = std(double(xfilled));
            standevy = std(double(yfilled));
            for j = 1: length(rawstrokes)
                rawstroke = rawstrokes{j};
                rawstroke(1,:) = rawstroke(1,:)*stdv/standevx;
                rawstroke(2,:) = rawstroke(2,:)*stdv/standevy;


                rawstrokes{j} = rawstroke;
            end
            temp = parsing.fill(rawstrokes);
            xfilled = temp(1,:)+templatedim/2;
            yfilled = temp(2,:)+templatedim/2;
            for j=1:length(xfilled)
                example(yfilled(j),xfilled(j),  1) = 1;
            end
        %end
            tempthreshH = getFilterThreshH(example(:,:,1), Hfilters);
            tempthreshV = getFilterThreshV(example(:,:,1), Vfilters);
            
            if(sum(tempthreshH) + sum(tempthreshV)> sum(bestHThresh) + sum(bestVThresh))
                bestHThresh=tempthreshH;
                bestVThresh = tempthreshV;
            end
        end
        Hthreshholds = min(Hthreshholds, bestHThresh);
        Vthreshholds = min(Vthreshholds, bestVThresh);
    end
end



