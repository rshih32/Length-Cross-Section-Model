function [ D ] = comparefeaturegrid( input, prototype )
%COMPAREFEATUREGRID Summary of this function goes here
%   Detailed explanation goes here
    D=0;
    for feature = 1:5
        for i = 1:12
            for j = 1:12
                protopatch = zeros(3,3);
                for ipatchpoint = -1:1
                    for jpatchpoint = -1:1
                        if(i+ipatchpoint >0 && i+ipatchpoint <=12 && j+jpatchpoint >0 && j+jpatchpoint <=12 )
                            protopatch(2+ipatchpoint,2+jpatchpoint) = prototype(i+ipatchpoint,j+jpatchpoint);
                        end
                    end
                end
                mindist = intmax;
                for idisplace = -1:1
                    for jdisplace=-1:1
                        checkpatch = zeros(3,3);
                        for ipatchpoint = -1:1
                            for jpatchpoint = -1:1
                                if(i+idisplace+ipatchpoint >0 && i+idisplace+ipatchpoint <=12 && j+jdisplace+jpatchpoint >0 && j+jdisplace+jpatchpoint <=12 )
                                    checkpatch(2+ipatchpoint,2+jpatchpoint) = input(i+idisplace+ipatchpoint,j+jdisplace+jpatchpoint);
                                end
                            end
                        end
                        dist = norm(protopatch-checkpatch);
                        if(dist<mindist)
                            mindist = dist;
                        end
                    end
                end
                D = D + mindist;
            end
        end
    end

end

