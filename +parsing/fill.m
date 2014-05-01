function [ filled, stroke ] = fill( substrokes )
%FILL Summary of this function goes here
%   Detailed explanation goes here
    x=[];
    y=[];
    xfilled = zeros(1,500000);
    yfilled = zeros(1,500000);
    stroke = zeros(1,500000);
    index=1;
    for j = 1: length(substrokes)
        
        points = substrokes{j};
        
        for k = 1: size(points,2)
            
            xraw = points(1,k);
            yraw = points(2,k);
            xcoord = int64(xraw);
            ycoord = int64(yraw);
            
            x=[x, xcoord];
            y=[y, ycoord];
            prevpoint = length(x) - 1;
            
            if k==1
                xfilled(index) = xcoord;
                yfilled(index) = ycoord;
                stroke(index) = j;
                index = index + 1;
%                 xfilled=[xfilled, xcoord];
%                 yfilled=[yfilled, ycoord];
            else
                xorient=1;
                if(xcoord-x(prevpoint) < 0)
                    xorient = -1;
                end
                yorient=1;
                if(ycoord-y(prevpoint) < 0)
                    yorient = -1;
                end
                
                if(ycoord-y(prevpoint)==0)
                    
                    for l=1:abs(xcoord-x(prevpoint))
                        xfilled(index) = x(prevpoint)+xorient*l;
                        yfilled(index) = y(prevpoint);
                        stroke(index) = j;
                        index = index + 1;
%                         xfilled = [xfilled, x(prevpoint)+xorient*l];
%                         yfilled = [yfilled, y(prevpoint)];
                    end
                elseif(xcoord-x(prevpoint)==0)
                    
                    for l=1:abs(ycoord-y(prevpoint))
                        xfilled(index) = x(prevpoint);
                        yfilled(index) = y(prevpoint)+yorient*l;
                        stroke(index) = j;
                        index = index + 1;
%                         xfilled = [xfilled, x(prevpoint)];
%                         yfilled = [yfilled, y(prevpoint)+yorient*l];
                    end
                else
                    slope=abs(double(ycoord-y(prevpoint))/double(xcoord-x(prevpoint)));
                    if slope < 1
                        for l=1:abs(xcoord-x(prevpoint))
                            for m=1:abs(ycoord-y(prevpoint))
                                if double(m)/double(l) >= slope
                                    xfilled(index) = x(prevpoint)+xorient*l;
                                    yfilled(index) = y(prevpoint)+yorient*m;
                                    stroke(index) = j;
                                    index = index + 1;
%                                     xfilled = [xfilled, x(prevpoint)+xorient*l];
%                                     yfilled = [yfilled, y(prevpoint)+yorient*m];
                                    break;
                                end
                            end
                        end
                    else
                        for m=1:abs(ycoord-y(prevpoint))
                            for l=1:abs(xcoord-x(prevpoint))
                                if double(m)/double(l) <= slope
                                    xfilled(index) = x(prevpoint)+xorient*l;
                                    yfilled(index) = y(prevpoint)+yorient*m;
                                    stroke(index) = j;
                                    index = index + 1;
%                                     xfilled = [xfilled, x(prevpoint)+xorient*l];
%                                     yfilled = [yfilled, y(prevpoint)+yorient*m];
                                    break;
                                end
                            end
                        end
                    end
                    
                end
                
                
            end
            
        end
        
        
    end
    
    filled = [xfilled;yfilled];
    filled=filled(:,any(filled));
    
    stroke=stroke(1,1:length(filled));

end

