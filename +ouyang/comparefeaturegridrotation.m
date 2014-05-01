function [ D ] = comparefeaturegridrotation( rawstrokes, prototypes )
%COMPAREFEATUREGRIDROTATION Summary of this function goes here
%   Detailed explanation goes here
    numrotations=18;
    minD = intmax;
    
    [w,x,y,z] = size(prototypes);
    
    %for rotation=1:numrotations

        %for all angles
       % angle = 2*pi/numrotations;
       % Rotate = [cos(angle), -sin(angle); sin(angle),cos(angle)];
       % for j = 1: length(rawstrokes)
        %    rawstroke = rawstrokes{j};
        %    rawstroke = Rotate * rawstroke;

       %     rawstrokes{j} = rawstroke;
       % end
        fg = ouyang.smoothdownsample(ouyang.featuregrid(rawstrokes));
        for p = 1: z
            
            prototype = prototypes(:,:,:,p);
            D = ouyang.comparefeaturegrid(fg,prototype);
            if(D<minD)
                minD = D;
            end
        end
    %end
end

