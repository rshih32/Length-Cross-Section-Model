function [rotations, lengthtemplate ] = genlengthtemplate(firstexample,examples)
%TEMPLATE Summary of this function goes here
%   Detailed explanation goes here

    templatedim=300;
    stdv=50;
    [iO,jO,sO] = find(sparse(ones(templatedim,templatedim)));
    templatedimensions = [iO,jO];
    %draw the first examples
    numrotations = 18;
    rotations = zeros(1,numrotations);
    lengthtemplate = zeros(templatedim,templatedim,numrotations);
    weightmatrix = zeros(templatedim,templatedim,3);
    
    example = zeros(templatedim,templatedim,3);
    rawstrokes=firstexample;
    
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
    temp = parsing.fill(rawstrokes);
    xfilled = temp(1,:);
    yfilled = temp(2,:);

    for j=1:length(xfilled)
        example(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2,  1) = 1;
    end
    
    template = example;
    
    edges = template(:,:,1);
    
    [IDX2,D2] = knnsearch([double(yfilled+templatedim/2)',double(xfilled+templatedim/2)'],templatedimensions);
    for k=1:length(D2)
        xycoord = templatedimensions(k,:);

        weightmatrix(xycoord(1),xycoord(2),1) = parsing.gauss(D2(k),0,6);
    end
    
    
    %fill the rest
    for i=1:length(examples)
        i
        templengthtemplate = zeros(templatedim,templatedim,numrotations);
        bestrotation = 1;
        example = zeros(templatedim,templatedim,3);
        rawstrokes=examples{i};
        chosenmatrix=[];
        dist = intmax;
        [iS,jS,sS] = find(sparse(template(:,:,1).*weightmatrix(:,:,1)));
        [iE,jE,sE] = find(sparse(edges));
        for rotation=1:numrotations
            
            %for all angles
            angle = 2*pi/numrotations;
            Rotate = [cos(angle), -sin(angle); sin(angle),cos(angle)];
            for j = 1: length(rawstrokes)
                rawstroke = rawstrokes{j};
                rawstroke = Rotate * rawstroke;

                rawstrokes{j} = rawstroke;
            end
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
            temp = parsing.fill(rawstrokes);
            xfilled = temp(1,:);
            yfilled = temp(2,:);
            pointmatrix = zeros(templatedim,templatedim);
            for j=1:length(xfilled)
                    
                pointmatrix(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2) = 1;
            end
            templengthtemplate(:,:,rotation) = pointmatrix;
            searchMatrix = [double(yfilled+templatedim/2)',double(xfilled+templatedim/2)'];
            
            searchMatrixWithGauss=ones(length(xfilled),3);
            searchMatrixWithGauss(:,1:2) = searchMatrix;
            pointsToCompare = [iS,jS,sS];        
            
            [IDX,D] = knnsearch(pointsToCompare,searchMatrixWithGauss);
            edgepoints = [iE,jE];
            [IDX0,D0] = knnsearch(searchMatrix,edgepoints);
            tempdist = sum(D);
            if(tempdist < dist)
                bestrotation = rotation;
                newedges = edges;
                chosenmatrix = searchMatrix;
                dist = tempdist;
                example = zeros(templatedim,templatedim,3);

                %fill method
                fillstrokes = cell(1,length(xfilled));
                for j=1:length(xfilled)
                    if(i==2)
                        newedges(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2) = 1;
                    else
                        if ~ (yfilled(j) + templatedim/2 == iS(IDX(j)) && xfilled(j) + templatedim/2 == jS(IDX(j)))
                            newedges(yfilled(j)+templatedim/2,xfilled(j)+templatedim/2) = 1;
                            newedges(iS(IDX(j)),jS(IDX(j))) = 0;
                        end
                        
                    end
                    fillstrokes{j} = [xfilled(j)+templatedim/2,jS(IDX(j));yfilled(j)+templatedim/2,iS(IDX(j))];
                end
                
                temp = parsing.fill(fillstrokes);
                xfilled2 = temp(1,:);
                yfilled2 = temp(2,:);
                
                for j=1:length(xfilled2)
                    
                    example(yfilled2(j),xfilled2(j),  1) = 1;
                end
                
                %fill method
                fillstrokes = cell(1,length(edgepoints));
                for j=1:length(iE)
                    if(i~=2)
                        smallerx=min([edgepoints(j,2),searchMatrix(IDX0(j),2)]);
                        biggerx=max([edgepoints(j,2),searchMatrix(IDX0(j),2)]);
                        smallery=min([edgepoints(j,1),searchMatrix(IDX0(j),1)]);
                        biggery=max([edgepoints(j,1),searchMatrix(IDX0(j),1)]);
                        checkx1 = int32(smallerx + 1/20*(biggerx-smallerx));
                        checky1 = int32(smallery + 1/20*(biggery-smallery));
                        checkx2 = int32(smallerx + 1/10*(biggerx-smallerx));
                        checky2 = int32(smallery + 1/10*(biggery-smallery));
                        checkx3 = int32(smallerx + 9/10*(biggerx-smallerx));
                        checky3 = int32(smallery + 9/10*(biggery-smallery));
                        checkx4 = int32(smallerx + 19/20*(biggerx-smallerx));
                        checky4 = int32(smallery + 19/20*(biggery-smallery));
                        
                        
                        if(template(checky1,checkx1) == 0 && template(checky2,checkx2) == 0 && template(checky3,checkx3) == 0 && template(checky4,checkx4) == 0)
                            newedges(edgepoints(j,1), edgepoints(j,2))=0;
                            newedges(searchMatrix(IDX0(j),1),searchMatrix(IDX0(j),2))=1;
                        end
                    end
                    fillstrokes{j} = [edgepoints(j,2),searchMatrix(IDX0(j),2);edgepoints(j,1),searchMatrix(IDX0(j),1)];
                end
                
                temp = parsing.fill(fillstrokes);
                xfilled = temp(1,:);
                yfilled = temp(2,:);
                
                for j=1:length(xfilled)
                    
                    example(yfilled(j),xfilled(j),  1) = 1;
                end
                
            end

        end
        orderedlengthtemplate = zeros(templatedim,templatedim, numrotations);
        orderedlengthtemplate(:,:,1:(numrotations-bestrotation)+1) = templengthtemplate(:,:,bestrotation:numrotations);
        orderedlengthtemplate(:,:,(numrotations-bestrotation)+2:numrotations) = templengthtemplate(:,:,1:bestrotation-1);
        lengthtemplate = lengthtemplate + 1/length(examples)*double(templatelengths(orderedlengthtemplate));
        rotations(bestrotation) = rotations(bestrotation)+1;
      edges = newedges;
      
            [IDX2,D2] = knnsearch(chosenmatrix,templatedimensions);
            tempweight = zeros(templatedim,templatedim,3);
            for k=1:length(D2)
                xycoord = templatedimensions(k,:);
                
                tempweight(xycoord(1),xycoord(2),1) = parsing.gauss(D2(k),0,6);
            end
            
            weightmatrix = weightmatrix*(i-1)/i + tempweight*1/i;
            
        template = template|example;
    end
    template=double(template);
    template(:,:,2)=weightmatrix(:,:,1);
    template(:,:,3) = edges;
    %TEST(:,:,1) = template(:,:,1);
    %TEST(:,:,3) = edges;
    %template = TEST;
    %image(template);
   %template(:,:,2) = weightmatrix(:,:,1);
   
   %template(:,:,3) = edges;
   %template(:,:,2)=weightmatrix(:,:,1);
%image(template);    
end


