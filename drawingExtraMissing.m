function [ example, strokeidentifier ] = drawingExtraMissing( rawstrokes, strokerelation )
        templatedim=300;
        stdv=50;
        example=zeros(templatedim,templatedim,4);
        strokeidentifier = zeros(templatedim,templatedim,4);
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
        missingstrokes = {};
        msindex=1;
        normalstrokes = {};
        nsindex=1;
        extrastrokes = {};
        esindex=1;
        otherstrokes = {};
        osindex=1;
        
        msidentifiers = zeros(1,length(rawstrokes));
        nsidentifiers = zeros(1,length(rawstrokes));
        esidentifiers = zeros(1,length(rawstrokes));
        osidentifiers = zeros(1,length(rawstrokes));
        for j = 1: length(rawstrokes)
            
            if strokerelation(j) == -1
                
                missingstrokes{msindex} = rawstrokes{j};
                msidentifiers(msindex) = j;
                msindex=msindex+1;
            elseif strokerelation(j) == 0
                
                normalstrokes{nsindex} = rawstrokes{j};
                nsidentifiers(nsindex) = j;
                nsindex=nsindex+1;
            elseif strokerelation(j) == 1
                
                extrastrokes{esindex} = rawstrokes{j};
                esidentifiers(esindex) = j;
                esindex=esindex+1;
            else
                otherstrokes{osindex} = rawstrokes{j};
                osidentifiers(osindex) = j;
                osindex=osindex+1;
            end
        end
        
        rawstrokes = missingstrokes;
        [temp,stroke] = parsing.fill(rawstrokes);
        xfilled = temp(1,:);
        yfilled = temp(2,:);

        for j=1:length(xfilled)
            if(yfilled(j)+templatedim/2 > 0 && yfilled(j)+templatedim/2 < templatedim && xfilled(j)+templatedim/2 >0 && xfilled(j)+templatedim/2 < templatedim)
                example(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  1) = 1;
                strokeidentifier(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  1) = msidentifiers(stroke(j));
            end
        end
        
        rawstrokes = extrastrokes;
        [temp,stroke] = parsing.fill(rawstrokes);
        xfilled = temp(1,:);
        yfilled = temp(2,:);

        for j=1:length(xfilled)
            if(yfilled(j)+templatedim/2 > 0 && yfilled(j)+templatedim/2 < templatedim && xfilled(j)+templatedim/2 >0 && xfilled(j)+templatedim/2 < templatedim)
                example(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  2) = 1;
                strokeidentifier(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  2) = esidentifiers(stroke(j));
            end
        end
        
        rawstrokes = normalstrokes;
        [temp,stroke] = parsing.fill(rawstrokes);
        xfilled = temp(1,:);
        yfilled = temp(2,:);

        for j=1:length(xfilled)
            if(yfilled(j)+templatedim/2 > 0 && yfilled(j)+templatedim/2 < templatedim && xfilled(j)+templatedim/2 >0 && xfilled(j)+templatedim/2 < templatedim)
                example(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  3) = 1;
                strokeidentifier(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  3) = nsidentifiers(stroke(j));
            end
        end
        
        rawstrokes = otherstrokes;
        [temp,stroke] = parsing.fill(rawstrokes);
        xfilled = temp(1,:);
        yfilled = temp(2,:);

        for j=1:length(xfilled)
            if(yfilled(j)+templatedim/2 > 0 && yfilled(j)+templatedim/2 < templatedim && xfilled(j)+templatedim/2 >0 && xfilled(j)+templatedim/2 < templatedim)
                example(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  4) = 1;
                strokeidentifier(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  4) = osidentifiers(stroke(j));
            end
        end

end

