function [ featuremap ] = featuregrid(rawstrokes)
%FEATUREGRID Summary of this function goes here
%   Detailed explanation goes here
    featuremap = zeros(24,24,5);
    templatedim=300;
    stdv=50;
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
    
   
    feature0 = zeros(24,24);
    feature45 = zeros(24,24);
    feature90 = zeros(24,24);
    feature135 = zeros(24,24);
    featureend = zeros(24,24);
    [temp,stroke] = parsing.fill(rawstrokes);
    xfilled = temp(1,:);
    yfilled = temp(2,:);
    
    currstroke = -1;
    prevxcoord = -1;
    prevycoord = -1;
    for j=1:length(xfilled)
        xcoord = int32(xfilled(j) / (2.5*stdv/12)) + 13;
        ycoord = int32(yfilled(j) / (2.5*stdv/12)) + 13;
        if(xcoord > 0  && xcoord <= 24 && ycoord > 0  && ycoord <= 24)
            if(j == length(xfilled))
                featureend(ycoord,xcoord) = 1;
            end
            if(stroke(j) ~= currstroke)
                currstroke = stroke(j);
                featureend(ycoord,xcoord) = 1;
                if(prevxcoord ~= -1 && prevxcoord > 0  && prevxcoord <= 24 && prevycoord > 0  && prevycoord <= 24)
                 featureend(prevxcoord,prevycoord) = 1;
                end
            else
                if(j+4 <= length(xfilled) && stroke(j+4) == currstroke)
                    strokevector = [xfilled(j) - xfilled(j+4), yfilled(j) - yfilled(j+4)];
                    if(strokevector(2) < 0 )
                        strokevector = strokevector * -1;
                    end
                    angle = acosd(dot(strokevector,[1,0])/norm(strokevector));
                    diffangle = angle;
                    if (diffangle < 45)
                        val = 1-diffangle/45;
                        feature0(ycoord,xcoord) = max(feature0(ycoord,xcoord), val);
                    end

                    diffangle = abs(angle-45);
                    if (diffangle < 45)
                        val = 1-diffangle/45;
                        feature45(ycoord,xcoord) = max(feature45(ycoord,xcoord), val);
                    end

                    diffangle = abs(angle-90);
                    if (diffangle < 45)
                        val = 1-diffangle/45;
                        feature90(ycoord,xcoord) = max(feature90(ycoord,xcoord), val);
                    end

                    diffangle = abs(angle-135);
                    if (diffangle < 45)
                        val = 1-diffangle/45;
                        feature135(ycoord,xcoord) = max(feature135(ycoord,xcoord), val);
                    end
                end
            end
            
        end
        
        prevxcoord = xcoord;
        prevycoord = ycoord;
       
    end
    featuremap(:,:,1) = feature0;
    featuremap(:,:,2) = feature45;
    featuremap(:,:,3) = feature90;
    featuremap(:,:,4) = feature135;
    size(featureend)
    featuremap(:,:,5) = featureend;
    
    
end

