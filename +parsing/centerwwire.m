function [examples, extras] = centerwwire( DOMexamples, DOMwires, substrokes, points, inputexamples, inputextras)
%CENTER Summary of this function goes here
%   Detailed explanation goes here
    examples = inputexamples;
    extras = inputextras;
    for i = 1:length(DOMexamples)
        extrastrokes = 0;
        DOMsubstrokes = DOMexamples{i}.getElementsByTagName('arg');
        rawstrokes = cell(1,DOMsubstrokes.getLength);
        tocomp1=[];
        for j = 0: DOMsubstrokes.getLength - 1
            
            substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
            DOMsubstroke = substrokes(substrokeID);

            DOMpoints = DOMsubstroke.getElementsByTagName('arg');
            rawstroke = zeros(2,DOMpoints.getLength);
            tocomptemp =zeros(DOMpoints.getLength,2);
            for k = 0: DOMpoints.getLength - 1
                
                 pointID = char(DOMpoints.item(k).getFirstChild.getData);
                 DOMpoint = points(pointID);
                 xraw = str2double(char(DOMpoint.getAttribute('x')));
                 yraw = str2double(char(DOMpoint.getAttribute('y')));
                 rawstroke(:,k+1) = [xraw;yraw];
                 tocomptemp(k+1,:) = [xraw,yraw];

            end
            rawstrokes{j+1} = rawstroke;
            tocomp1=[tocomp1;tocomptemp];
        end
        
        for i2 = 1:length(DOMwires)
        
            DOMsubstrokes = DOMwires{i2}.getElementsByTagName('arg');
            tocomp2=zeros(2,2);
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
                     if(k==0)
                         tocomp2(1,:) = [xraw,yraw];
                     end
                     if(k==DOMpoints.getLength - 1)
                         tocomp2(2,:) = [xraw,yraw];
                     end

                end
                [IDX,D] = knnsearch(tocomp1,tocomp2);
                if(min(D) < 10)
                    rawstrokes = [rawstrokes, rawstroke];
                    extrastrokes = extrastrokes + 1;
                end

            end
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
        extras = [extras, extrastrokes];
    end
    
end

