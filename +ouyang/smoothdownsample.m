function [ smallfeaturegrid ] = smoothdownsample( featuregrid )
%SMOOTHDOWNSAMPLE Summary of this function goes here
%   Detailed explanation goes here
    gaussianfilter = zeros(3,3);
    for i = 1:3
        for j = 1:3
            dist = norm([1-i,1-j]);
            gaussianfilter(i,j) = parsing.gauss(dist, 0 , 1);
        end
    end
    smoothedfeaturegrid = featuregrid;
    for feature = 1:5
        for i = 1:size(featuregrid(:,:,feature),1)
            for j = 1: size(featuregrid(:,:,feature),2)
                for offy = 0:2
                    for offx = 0:2
                        gval = gaussianfilter(offy+1,offx+1);
                        if(i+offy<=24 && j+offx <=24)
                            smoothedfeaturegrid(i,j, feature) = max(smoothedfeaturegrid(i,j, feature),smoothedfeaturegrid(i+offy,j+offx,feature)*gval );
                        end
                        if(i+offy<=24 && j-offx >0)
                            smoothedfeaturegrid(i,j, feature) = max(smoothedfeaturegrid(i,j, feature),smoothedfeaturegrid(i+offy,j-offx,feature)*gval );
                        end
                        if(i-offy>0 && j+offx <=24)
                            smoothedfeaturegrid(i,j, feature) = max(smoothedfeaturegrid(i,j, feature),smoothedfeaturegrid(i-offy,j+offx,feature)*gval );
                        end
                        if(i-offy>0 && j-offx > 0)
                            smoothedfeaturegrid(i,j, feature) = max(smoothedfeaturegrid(i,j, feature),smoothedfeaturegrid(i-offy,j-offx,feature)*gval );
                        end
                    end
                end
            end
        end
    end
    smallfeaturegrid = zeros(12,12,5);
    for feature = 1:5
        for i = 1:12
            for j = 1:12
                iindex = (i-1)*2+1;
                jindex = (j-1)*2+1;
                smallfeaturegrid(i,j,feature) = max(max(smoothedfeaturegrid(iindex:iindex+1,jindex:jindex+1,feature)));
            end
        end
    end
end

