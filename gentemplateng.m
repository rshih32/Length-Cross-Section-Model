function [newtemplate] = gentemplateng(template)
%GENTEMPLATENG Summary of this function goes here
%   Detailed explanation goes here
    
    positive = template(:,:,2)/max(max(template(:,:,2)));
    [a,b] = size(positive);
    newtemplate=zeros(a,b,3);
    newtemplate(:,:,2) = positive;
    negative = zeros(a,b);
    
    [iZ,jZ,sZ] = find(sparse(positive<.1));
    zerodimensions = [iZ,jZ];
    
    [iP,jP,sP] = find(sparse(positive>.1));
    
    
    [IDX2,D2] = knnsearch([iP,jP],zerodimensions);
    for k=1:length(D2)
        xycoord = zerodimensions(k,:);
        positive(xycoord(1),xycoord(2)) = 0;
        negative(xycoord(1),xycoord(2)) = 1;
    end
    newtemplate(:,:,2) = positive;
    newtemplate(:,:,3) = negative;

end

