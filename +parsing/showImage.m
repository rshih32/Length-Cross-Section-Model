function [] = showImage(rawstrokes)
%SHOWIMAGE Summary of this function goes here
%   Detailed explanation goes here
        temp = parsing.fill(rawstrokes);
        xfilled = temp(1,:);
        yfilled = temp(2,:);
        maxx=max(xfilled);
        maxy=max(yfilled);
        length(xfilled)
        sketchimage=zeros(maxy,maxx,3);
        for j=1:length(xfilled)
            
            sketchimage(yfilled(j),xfilled(j),  1) = 1;
        end
        figure;
        image(sketchimage);

end

