function [wrong,wrongclass] = classifywfilter(examples, classifier, ANDfulltemplates, NANDfulltemplates,NORfulltemplates,ORfulltemplates,NOTfulltemplates,XORfulltemplates,ANDthreshH, NANDthreshH, NORthreshH, ORthreshH, NOTthreshH, XORthreshH,ANDthreshV, NANDthreshV, NORthreshV, ORthreshV, NOTthreshV, XORthreshV,ANDrotations, NANDrotations, NORrotations, ORrotations, NOTrotations, XORrotations)
    
    numfilters = 5;
    stdv=50;
    templatedim=300;
    [ANDfiltersH,ANDfiltersV] = parsing.genfilterssimple(ANDfulltemplates,numfilters);
    [NANDfiltersH,NANDfiltersV] = parsing.genfilterssimple(NANDfulltemplates,numfilters);
    [NORfiltersH,NORfiltersV] = parsing.genfilterssimple(NORfulltemplates,numfilters);
    [NOTfiltersH,NOTfiltersV] = parsing.genfilterssimple(NOTfulltemplates,numfilters);
    [ORfiltersH,ORfiltersV] = parsing.genfilterssimple(ORfulltemplates,numfilters);
    [XORfiltersH,XORfiltersV] = parsing.genfilterssimple(XORfulltemplates,numfilters);
    [iO,jO,sO] = find(sparse(ones(templatedim,templatedim)));
    templatedimensions = [iO,jO];
    %draw the first examples
    numrotations = 18;
    wrong={};
    wrongclass={};
    index=1;
    %fill the rest
    for i=300:400%length(examples)
        i
        
        class='';
        best=zeros(templatedim,templatedim,3);
        rawstrokes=examples{i};
        avgperpoint=0;
        maxlen=0;
        bestrotation=0;
        for rotation=1:numrotations
            rotation
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
        %end
            len=0;
            avgpp=0;
            if(ANDrotations(rotation) > 0)
                [len1,avgpp1] = filterconvlengthHthresh(example(:,:,1), ANDfiltersH, ANDthreshH);
                 [len2,avgpp2] = filterconvlengthVthresh(example(:,:,1), ANDfiltersV, ANDthreshV);
                 len=len1+len2;
                 avgpp=avgpp1+avgpp2;
                if avgpp >avgperpoint 
    %             if(len>maxlen || (len == maxlen && avgpp > avgperpoint))
                    maxlen=len;
                    avgperpoint=avgpp;
                    class='AND';
                    best=example;
                bestrotation=rotation;
                end
            end
            if(NANDrotations(rotation) > 0)
             [len1,avgpp1] = filterconvlengthHthresh(example(:,:,1), NANDfiltersH, NANDthreshH);
                 [len2,avgpp2] = filterconvlengthVthresh(example(:,:,1), NANDfiltersV, NANDthreshV);
                 len=len1+len2;
                 avgpp=avgpp1+avgpp2;
                if avgpp >avgperpoint
    %             if(len>maxlen || (len == maxlen && avgpp > avgperpoint))
                    maxlen=len;
                    avgperpoint=avgpp;
                    class='NAND';
                    best=example;
                    bestrotation=rotation;

                end
            end
            if(NORrotations(rotation) > 0)
              [len1,avgpp1] = filterconvlengthHthresh(example(:,:,1), NORfiltersH, NORthreshH);
                 [len2,avgpp2] = filterconvlengthVthresh(example(:,:,1), NORfiltersV, NORthreshV);
                 len=len1+len2;
                 avgpp=avgpp1+avgpp2;
                 if avgpp >avgperpoint
    %             if(len>maxlen || (len == maxlen && avgpp > avgperpoint))
                    maxlen=len;
                    avgperpoint=avgpp;
                    class='NOR';
                    best=example;
                bestrotation=rotation;
                 end
            end
            if(NOTrotations(rotation) > 0)
               [len1,avgpp1] = filterconvlengthHthresh(example(:,:,1), NOTfiltersH, NOTthreshH);
                 [len2,avgpp2] = filterconvlengthVthresh(example(:,:,1), NOTfiltersV, NOTthreshV);
                 len=len1+len2;
                 avgpp=avgpp1+avgpp2;
                if avgpp >avgperpoint
    %             if(len>maxlen || (len == maxlen && avgpp > avgperpoint))
                    maxlen=len;
                    avgperpoint=avgpp;
                    class='NOT';
                    best=example;
                bestrotation=rotation;
                end
            end
            if(ORrotations(rotation) > 0)
               [len1,avgpp1] = filterconvlengthHthresh(example(:,:,1), ORfiltersH, ORthreshH);
                 [len2,avgpp2] = filterconvlengthVthresh(example(:,:,1), ORfiltersV, ORthreshV);
                 len=len1+len2;
                 avgpp=avgpp1+avgpp2;
                if avgpp >avgperpoint
    %             if(len>maxlen || (len == maxlen && avgpp > avgperpoint))
                    maxlen=len;
                    avgperpoint=avgpp;
                    class='OR';
                    best=example;
                bestrotation=rotation;
                end
            end
            if(XORrotations(rotation) > 0)
              [len1,avgpp1] = filterconvlengthHthresh(example(:,:,1), XORfiltersH, XORthreshH);
                 [len2,avgpp2] = filterconvlengthVthresh(example(:,:,1), XORfiltersV, XORthreshV);
                 len=len1+len2;
                 avgpp=avgpp1+avgpp2;
                if avgpp >avgperpoint
    %             if(len>maxlen || (len == maxlen && avgpp > avgperpoint))
                    maxlen=len;
                    avgperpoint=avgpp;
                    class='XOR';
                    best=example;
                bestrotation=rotation;
                end
            end
    

        end
        maxlen
        avgperpoint
        if(~strcmp(class,classifier))
           % image(best)
            bestrotation
            class
            
            wrongclass{index}=class;
            wrong{index}=best;
            index=index+1;
        end
    end
end



