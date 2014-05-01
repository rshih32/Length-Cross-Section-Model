function [ example ] = viewDrawingH( rawstrokes )
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
            rawstroke(1,:) = rawstroke(1,:)*stdv/standevy;
            rawstroke(2,:) = rawstroke(2,:)*stdv/standevy;


            rawstrokes{j} = rawstroke;
        end
        temp = parsing.fill(rawstrokes);
        xfilled = temp(1,:);
        yfilled = temp(2,:);

        for j=1:length(xfilled)
            if(yfilled(j)+templatedim/2 > 0 && yfilled(j)+templatedim/2 < templatedim && xfilled(j)+templatedim/2 >0 && xfilled(j)+templatedim/2 < templatedim)
             example(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  1) = 1;
            end
        end

end

