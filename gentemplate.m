function [ template ] = gentemplate(examples)
%TEMPLATE Summary of this function goes here
%   Detailed explanation goes here
    template = zeros(600,600,3);
    for i=1:length(examples)
        example = zeros(600,600,3);
        rawstrokes=examples{i};
        %for all angles
        angle = pi/18;
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
            rawstroke(1,:) = rawstroke(1,:)*100/standevx;
            rawstroke(2,:) = rawstroke(2,:)*100/standevy;


            rawstrokes{j} = rawstroke;
        end
        temp = parsing.fill(rawstrokes);
        xfilled = temp(1,:);
        yfilled = temp(2,:);

        for j=1:length(xfilled)
            example(yfilled(j)+300,xfilled(j)+300,  1) = 1;
        end
        %calc dist, if best replace BEST example 
%      end for all angles
%       add and combine BEST example
        template = template*(i-1)/i + example*1/i;
    end
image(template);    
end


