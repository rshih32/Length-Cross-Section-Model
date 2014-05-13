function [ votes,classresult, querytemplateall,querytemplatestrokeidentifierall ] = identifystrokeshelper( rawstrokes, strokerelation, numslices, lentemplate, rotation )
%IDENTIFYSTROKESHELPER Summary of this function goes here
%   Detailed explanation goes here
    [fulldrawing, strokeidentifiers] = drawingExtraMissing(rawstrokes,strokerelation);

%     figure;
%     image(fulldrawing(:,:,1:3));

    example(:,:,1) = fulldrawing(:,:,1)|fulldrawing(:,:,2)|fulldrawing(:,:,3)|fulldrawing(:,:,4);
    %normalstrokes
    strokeidentifiersoverlay = strokeidentifiers(:,:,3);

    extrastrokeidentifiers = strokeidentifiers(:,:,2);
    strokeidentifiersoverlay(strokeidentifiersoverlay==0) = extrastrokeidentifiers(strokeidentifiersoverlay==0);

    strokeidentifiersoverlayall = strokeidentifiersoverlay;
    missingstrokeidentifiers = strokeidentifiers(:,:,1);
    strokeidentifiersoverlayall(strokeidentifiersoverlayall==0) = missingstrokeidentifiers(strokeidentifiersoverlayall==0);
    otherstrokeidentifiers = strokeidentifiers(:,:,4);
    strokeidentifiersoverlayall(strokeidentifiersoverlayall==0) = otherstrokeidentifiers(strokeidentifiersoverlayall==0);



    [querytemplate, querytemplateall, querytemplatestrokeidentifierall] = templatelengthspartial3(strokeidentifiersoverlay, strokeidentifiersoverlayall, numslices, strokerelation);

    
%     querytemplateall
%     querytemplatestrokeidentifierall
%     parsing.viewLengthTemplateExtraMissing(querytemplateall, querytemplatestrokeidentifierall, strokerelation);
% querytemplate
% querytemplateall

    %TODO remove missing strokes from the query
  
    [matchvotes,startintervalscalematch,qtcomboinfo] = matchlentemplatesbrute2( querytemplate, lentemplate, rotation );
    classresult= matchvotes(rotation);
    
    
%      startintervalscale = startintervalscalematch(:,rotation)
%      parsing.viewMatchedLengthTemplate(querytemplate, lentemplate(:,:,rotation), startintervalscale(1), startintervalscale(2), startintervalscale(3));


    %1 is missing
    % 2 is part of shape
    % 3 is extra
    % 4 is other
    votes = zeros(length(strokerelation), 4);
    
    classifications = zeros(numslices, size(querytemplateall,2));
    
    for i=1:numslices
%          i
    %      querytemplate(i,:)
    %      querytemplateall(i,:)
    %      querytemplateall(i,:)*startintervalscalematch(3,rotation)
    %      qtcomboinfo{rotation,i,6}
    %      qtcomboinfo{rotation,i,4}
    %      qtcomboinfo{rotation,i,5}
      
         classification = classifyLengthPiece( querytemplateall(i,:)*startintervalscalematch(3,rotation), querytemplatestrokeidentifierall(i,:), qtcomboinfo{rotation,i,3}, qtcomboinfo{rotation,i,6}, qtcomboinfo{rotation,i,4},  qtcomboinfo{rotation,i,5}, strokerelation,classresult,startintervalscalematch(4,rotation) );
         for j=1:length(classification)
             votes(querytemplatestrokeidentifierall(i,j),classification(j) + 2) = votes(querytemplatestrokeidentifierall(i,j),classification(j) + 2)  + 1;
         end
         classifications(i,1:length(classification)) = classification;
    end
    
%     parsing.viewLengthTemplateClassified(querytemplateall,classifications);

end

