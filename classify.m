function [wrong,wrongclass] = classify(examples, classifier, ANDfulltemplates, NANDfulltemplates,NORfulltemplates,ORfulltemplates,NOTfulltemplates,XORfulltemplates)
    ANDfulltemplates(:,:,2)=10000*ANDfulltemplates(:,:,2)/sum(sum(ANDfulltemplates(:,:,2)));
    NANDfulltemplates(:,:,2)=10000*NANDfulltemplates(:,:,2)/sum(sum(NANDfulltemplates(:,:,2)));
    ORfulltemplates(:,:,2)=10000*ORfulltemplates(:,:,2)/sum(sum(ORfulltemplates(:,:,2)));
    NORfulltemplates(:,:,2)=10000*NORfulltemplates(:,:,2)/sum(sum(NORfulltemplates(:,:,2)));
    NOTfulltemplates(:,:,2)=10000*NOTfulltemplates(:,:,2)/sum(sum(NOTfulltemplates(:,:,2)));
    XORfulltemplates(:,:,2)=10000*XORfulltemplates(:,:,2)/sum(sum(XORfulltemplates(:,:,2)));
    
%     ANDfulltemplates(:,:,3)=1000*ANDfulltemplates(:,:,2)/sum(sum(ANDfulltemplates(:,:,3)));
%     NANDfulltemplates(:,:,3)=1000*NANDfulltemplates(:,:,2)/sum(sum(NANDfulltemplates(:,:,3)));
%     ORfulltemplates(:,:,3)=1000*ORfulltemplates(:,:,2)/sum(sum(ORfulltemplates(:,:,3)));
%     NORfulltemplates(:,:,3)=1000*NORfulltemplates(:,:,2)/sum(sum(NORfulltemplates(:,:,3)));
%     NOTfulltemplates(:,:,3)=1000*NOTfulltemplates(:,:,2)/sum(sum(NOTfulltemplates(:,:,3)));
%     XORfulltemplates(:,:,3)=1000*XORfulltemplates(:,:,2)/sum(sum(XORfulltemplates(:,:,3)));
    
    
    
    templatedim=300;
    stdv=50;
    [iO,jO,sO] = find(sparse(ones(templatedim,templatedim)));
    templatedimensions = [iO,jO];
    %draw the first examples
    numrotations = 18;
    wrong={};
    wrongclass={};
    index=1;
    %fill the rest
    for i=1:length(examples)
        i
        class='';
        best=zeros(templatedim,templatedim,3);
        rawstrokes=examples{i};
        avgperpoint=intmin;
        for rotation=1:numrotations
            %if(rotationdist(rotation) > 0)
                
                example = zeros(templatedim,templatedim,3);
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
                xfilled = temp(1,:)+templatedim/2;
                yfilled = temp(2,:)+templatedim/2;
                for j=1:length(xfilled)
                    example(yfilled(j),xfilled(j),  1) = 1;
                end
                avgpp=(sum(sum(example(:,:,1).*ANDfulltemplates(:,:,2)))-sum(sum(example(:,:,1).*ANDfulltemplates(:,:,3))))/length(xfilled);
                if(avgpp > avgperpoint)
                    avgperpoint=avgpp;
                    class='AND';
                    best=example;
                end
                avgpp=(sum(sum(example(:,:,1).*NANDfulltemplates(:,:,2)))-sum(sum(example(:,:,1).*NANDfulltemplates(:,:,3))))/length(xfilled);
                if(avgpp > avgperpoint)
                    avgperpoint=avgpp;
                    class='NAND';
                    best=example;
                end
                avgpp=(sum(sum(example(:,:,1).*NORfulltemplates(:,:,2)))-sum(sum(example(:,:,1).*NORfulltemplates(:,:,3))))/length(xfilled);
                if(avgpp > avgperpoint)
                    avgperpoint=avgpp;
                    class='NOR';
                    best=example;
                end
                avgpp=(sum(sum(example(:,:,1).*NOTfulltemplates(:,:,2)))-sum(sum(example(:,:,1).*NOTfulltemplates(:,:,3))))/length(xfilled);
                if(avgpp > avgperpoint)
                    avgperpoint=avgpp;
                    class='NOT';
                    best=example;
                end
                avgpp=(sum(sum(example(:,:,1).*ORfulltemplates(:,:,2)))-sum(sum(example(:,:,1).*ORfulltemplates(:,:,3))))/length(xfilled);
                if(avgpp > avgperpoint)
                    avgperpoint=avgpp;
                    class='OR';
                    best=example;
                end
                avgpp=(sum(sum(example(:,:,1).*XORfulltemplates(:,:,2)))-sum(sum(example(:,:,1).*XORfulltemplates(:,:,3))))/length(xfilled);
                if(avgpp > avgperpoint)
                    avgperpoint=avgpp;
                    class='XOR';
                    best=example;
                end
                %foreach template

            %end

        end
        
        if(~strcmp(class,classifier))
            class
            wrongclass{index}=class;
            wrong{index}=best;
            index=index+1;
            
            best(:,:,2) = ORfulltemplates(:,:,2);
            best(:,:,3) = ORfulltemplates(:,:,3);
             image(best);
        end
    end
end



