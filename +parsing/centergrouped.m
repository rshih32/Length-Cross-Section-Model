function [examples] = centergrouped( DOMexamples, gsubstrokes, substrokes, substrokemap, subtypes, points, inputexamples)
%CENTER Summary of this function goes here
%   Detailed explanation goes here
    examples = inputexamples;
    for i = 1:length(DOMexamples)
        
        DOMsubstrokes = DOMexamples{i}.getElementsByTagName('arg');
        rawstrokes = cell(1,DOMsubstrokes.getLength);
        for j = 0: DOMsubstrokes.getLength - 1
            
            substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
            DOMsubstroke = substrokes(substrokeID);

            DOMpoints = DOMsubstroke.getElementsByTagName('arg');
            rawstroke = zeros(2,DOMpoints.getLength);
            for k = 0: DOMpoints.getLength - 1
                 pointID = char(DOMpoints.item(k).getFirstChild.getData);
                 DOMpoint = points(pointID);
                 xraw = str2double(char(DOMpoint.getAttribute('x')));
                 yraw = str2double(char(DOMpoint.getAttribute('y')));
                 rawstroke(:,k+1) = [xraw;yraw];


            end
            rawstrokes{j+1} = rawstroke;

        end

        temp = parsing.fill(rawstrokes);
        xfilled = temp(1,:);
        yfilled = temp(2,:);


        meanx=mean(xfilled);
        meany=mean(yfilled);
        for j = 1: length(rawstrokes)
            rawstroke = rawstrokes{j};
            rawstroke(1,:) = rawstroke(1,:) - meanx;
            rawstroke(2,:) = rawstroke(2,:) - meany;
            rawstrokes{j} = rawstroke;
        end
        examples{length(examples) + 1} = rawstrokes;
    end
    
end

