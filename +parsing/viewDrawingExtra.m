function [ example ] = viewDrawingExtra( rawstrokes, strokerelation )
        templatedim=300;
        stdv=50;
        example=zeros(templatedim,templatedim,3);
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
        
        for j = 1: length(rawstrokes)
            
            if strokerelation(j) == -1
                'a'
                missingstrokes{msindex} = rawstrokes{j};
                msindex=msindex+1;
            elseif strokerelation(j) == 0
                'b'
                normalstrokes{nsindex} = rawstrokes{j};
                nsindex=nsindex+1;
            else
                'c'
                extrastrokes{esindex} = rawstrokes{j};
                esindex=esindex+1;
            end
        end
       
        
        rawstrokes = missingstrokes;
        temp = parsing.fill(rawstrokes);
        xfilled = temp(1,:);
        yfilled = temp(2,:);

        for j=1:length(xfilled)
            if(yfilled(j)+templatedim/2 > 0 && yfilled(j)+templatedim/2 < templatedim && xfilled(j)+templatedim/2 >0 && xfilled(j)+templatedim/2 < templatedim)
                example(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  1) = 1;
            end
        end
        
        rawstrokes = extrastrokes;
        temp = parsing.fill(rawstrokes);
        xfilled = temp(1,:);
        yfilled = temp(2,:);

        for j=1:length(xfilled)
            if(yfilled(j)+templatedim/2 > 0 && yfilled(j)+templatedim/2 < templatedim && xfilled(j)+templatedim/2 >0 && xfilled(j)+templatedim/2 < templatedim)
                example(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  2) = 1;
            end
        end
        
        rawstrokes = normalstrokes;
        temp = parsing.fill(rawstrokes);
        xfilled = temp(1,:);
        yfilled = temp(2,:);

        for j=1:length(xfilled)
            if(yfilled(j)+templatedim/2 > 0 && yfilled(j)+templatedim/2 < templatedim && xfilled(j)+templatedim/2 >0 && xfilled(j)+templatedim/2 < templatedim)
                example(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  3) = 1;
            end
        end

end

