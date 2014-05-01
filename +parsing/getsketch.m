function [ sketches ] = getsketch( substrokes, points,inputsketches)
%DRAW Summary of this function goes here
%   Detailed explanation goes here
    sketches = inputsketches;
    
        DOMsubstrokes = substrokes.values;
        
        rawstrokes = cell(1,length(DOMsubstrokes));
        xvals=zeros(1,length(points));
        yvals=zeros(1,length(points));
        pointindex=1;
        for j = 1: length(DOMsubstrokes)
            
            DOMsubstroke = DOMsubstrokes{j};
            
            DOMpoints = DOMsubstroke.getElementsByTagName('arg');
            
            rawstroke = zeros(2,DOMpoints.getLength);
            for k = 0: DOMpoints.getLength - 1
                 pointID = char(DOMpoints.item(k).getFirstChild.getData);
                 DOMpoint = points(pointID);
                 xraw = str2double(char(DOMpoint.getAttribute('x')));
                 yraw = str2double(char(DOMpoint.getAttribute('y')));
                 rawstroke(:,k+1) = [xraw;yraw];
                xvals(pointindex) = xraw;
                yvals(pointindex) = yraw;
                pointindex=pointindex+1;

            end
            rawstrokes{j} = rawstroke;

        end
       
        scaledown=5;
        
        minx=int32(min(xvals)/scaledown);
        miny=int32(min(yvals)/scaledown);
        maxx=int32(max(xvals)/scaledown) - minx + 1;
        maxy=int32(max(yvals)/scaledown) - miny + 1;
        
        for j = 1: length(rawstrokes)
            
            rawstroke = rawstrokes{j};
            
            rawstroke(1,:) = int32(rawstroke(1,:)/scaledown) - minx+1;
            rawstroke(2,:) = int32(rawstroke(2,:)/scaledown) - miny+1;
            rawstrokes{j} = rawstroke;
        end
        sketches{length(sketches) + 1} = rawstrokes;
        
         
        temp = parsing.fill(rawstrokes);
        xfilled = temp(1,:);
        yfilled = temp(2,:);
        
        length(xfilled)
        sketchimage=zeros(maxy,maxx,3);
        for j=1:length(xfilled)
            
            sketchimage(yfilled(j),xfilled(j),  1) = 1;
        end
        image(sketchimage);

end

