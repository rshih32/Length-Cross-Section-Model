function [ Hfilterfamily,Vfilterfamily ] = genfilters(fullfilter,numslices,scale)
%GENFILTERS Summary of this function goes here
%   Detailed explanation goes here
    Hfilterfamily=cell(1,numslices);
    Vfilterfamily=cell(1,numslices);
    combinedfilter=fullfilter(:,:,1).*fullfilter(:,:,2);
    Sps=sparse(combinedfilter);
    [y,x,s]=find(Sps);
    %y=y-min(y) + 1;
    x=x-min(x) + 1;
    Sps=sparse(y,x,s);
    
    cropped = full(Sps);
     
    scaled = imresize(cropped, scale);
    [a,b] = size(scaled);
    scaled(scaled>1)=1;
    scaled(scaled<0)=0;
    for i=1:numslices
        
        pieceH = scaled(:,int32(b*(i-1)/numslices)+1:int32(b*i/numslices));
        [aH,bH] = size(pieceH);
        filterPieceH =zeros(aH,bH,3);
    	filterPieceH(:,:,2)=pieceH;
        filterPieceH=filterPieceH/max(max(max(filterPieceH)));
        Hfilterfamily{i} = filterPieceH;
      
        
        pieceV = scaled(int32(a*(i-1)/numslices)+1:int32(a*i/numslices),:);
        [aV,bV] = size(pieceV);
        filterPieceV =zeros(aV,bV,3);
    	filterPieceV(:,:,2)=pieceV;
        filterPieceV=filterPieceV/max(max(max(filterPieceV)));
        Vfilterfamily{i} = filterPieceV;
    end
    %newtemplate=zeros(a,b,3);
    %newtemplate(:,:,2)=cropped;
    

end

