function [ examples, extrastrokes ] = removestrokes( inputExamples , inputextrastrokes)
%REMOVESTROKES Summary of this function goes here
%   Detailed explanation goes here
examples = cell(1 ,length(inputExamples));
extrastrokes = zeros(1,length(inputextrastrokes));
for i=1:length(inputExamples)
    rawstrokes = inputExamples{i};
    cannotremove = round(rand(1)*(length(rawstrokes) - inputextrastrokes(i)-1))+1;
    
    newstrokes = {};
    xpoints = [];
    ypoints = [];
    for j = 1: length(rawstrokes) - inputextrastrokes(i)
        if ~(j==cannotremove)
            if rand(1) > .75
                rawstroke = rawstrokes{j};
                newstrokes=[newstrokes,rawstroke];
                xpoints=[xpoints, rawstroke(1,:)];
                ypoints=[ypoints, rawstroke(2,:)];
            end
        else
            rawstroke = rawstrokes{j};
            newstrokes=[newstrokes,rawstroke];
            xpoints=[xpoints, rawstroke(1,:)];
            ypoints=[ypoints, rawstroke(2,:)];
        end
    end
    extras=0;
    for j = length(rawstrokes) - inputextrastrokes(i) + 1 : length(rawstrokes)
        if rand(1) > .66
                rawstroke = rawstrokes{j};
                newstrokes=[newstrokes,rawstroke];
                xpoints=[xpoints, rawstroke(1,:)];
                ypoints=[ypoints, rawstroke(2,:)];
                extras = extras + 1;
        end
    end
    meanx = mean(xpoints);
    meany = mean(ypoints);
    for j=1:length(newstrokes)
        rawstroke = newstrokes{j};
        
        rawstroke(1,:) = rawstroke(1,:)- meanx;
        rawstroke(2,:) = rawstroke(2,:)- meany;
        newstrokes{j} = rawstroke;
    end
    examples{i} = newstrokes;
    extrastrokes(i) = extras;
end


end

