function [ Hfilterfamily, Vfilterfamily] = genfilterssimple(fullfilter,numslices)
%GENFILTERS Summary of this function goes here
%   Detailed explanation goes here
    
    Hfilterfamily=cell(1,numslices);
    Vfilterfamily=cell(1,numslices);
    
    
    prunedfilter=fullfilter(:,:,2)/max(max(fullfilter(:,:,2)));
    
    Sps=sparse(prunedfilter);
    [y,x,s]=find(Sps);
    
    xH=x-min(x) + 1;
    SpsH=sparse(y,xH,s);
    
    croppedH = full(SpsH);
    
    yH=y-min(y) + 1;
    SpsV =sparse(yH,x,s);
    croppedV = full(SpsV);
    
    [aH,bH] = size(croppedH);
    scaledH = zeros(300,bH);
    scaledH(1:aH,:)=croppedH(:,:);
    
    [aV,bV] = size(croppedV);
    scaledV = zeros(aV,300);
    scaledV(:,1:bV)=croppedV(:,:);
    
    for i=1:numslices
        
        pieceH = scaledH(:,int32(bH*(i-1)/numslices)+1:int32(bH*i/numslices));
        [apH,bpH] = size(pieceH);
        filterPieceH =zeros(apH,bpH,3);
    	filterPieceH(:,:,2)=pieceH;
        
        filterPieceH=1000*filterPieceH/sum(sum(sum(filterPieceH)));
        filterPieceH(filterPieceH>1)=1;
        filterPieceH(:,:,3)=double(pieceH<.001);
       
        Hfilterfamily{i} = filterPieceH;
      
        pieceV = scaledV(int32(aV*(i-1)/numslices)+1:int32(aV*i/numslices),:);
        [apV,bpV] = size(pieceV);
        filterPieceV =zeros(apV,bpV,3);
    	filterPieceV(:,:,2)=pieceV;
        
        filterPieceV=1000*filterPieceV/sum(sum(sum(filterPieceV)));
        filterPieceV(filterPieceV>1)=1;
        filterPieceV(:,:,3)=double(pieceV<.001);
       
        Vfilterfamily{i} = filterPieceV;
%         
    end
    %newtemplate=zeros(a,b,3);
    %newtemplate(:,:,2)=cropped;
    

end

