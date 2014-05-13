function [ classification ] = classifyLengthPiece( queryall, queryidentifier, querycombo, template, templatecombo,  qtprune, strokerelation ,votes,matchpercent)
%CLASSIFYLENGTHPIECE Summary of this function goes here
%   Detailed explanation goes here

    
    queryidentifier = queryidentifier(queryidentifier~=0);
    classification = ones(1, length(queryidentifier))*2;
    index=1;
    %if matching a query to an emptyspace, classify all grouped points as
    %extra
    if isempty(template)
        for i=1:length(queryidentifier)
            
            actualclass = strokerelation(queryidentifier(i));
            %strokes that were used in the query matching
            if(actualclass==1 || actualclass==0)
                classification(i) = 1;
            end
        end
    %if query consists of a single point, check for missing strokes
    
    elseif isempty(querycombo)
        
        if(~isempty(queryidentifier))
          
            
            found=false;
            queryindex=1;
            while ~found
                if(index > length(queryidentifier))
                    found=true;
                    queryindex=1;
                    classification(1)=-1;
                else
                    actualclass = strokerelation(queryidentifier(index));
                    %strokes that were used in the query matching
                    if(actualclass==1 || actualclass==0)
                        found=true;
                        classification(index) = 0;
                        queryindex=index;
                    end
                    index=index+1;
                end
            end

            for i=1:length(queryidentifier)
                sectionsize=0;
                if(i ~= queryindex)
                    if(i<queryindex)
                        sectionsize=sum(queryall(i:queryindex-1));
                    elseif(i>queryindex)
                        sectionsize=sum(queryall(queryindex:i-1));
                    end

                    for j=1:length(template)


                        if(votes < 0.00000001) 
                            if(abs(queryindex-i) <= length(template))
                                classification(i)=-1;
                            end
                        elseif(sectionsize/template(j) <1.2*(1/matchpercent) && sectionsize/template(j) > .8*matchpercent)

                            classification(i)=-1;
                        end
                    end
                end
            end
        end
        
    else
       
        prunedsize = 0;
        %classify start query prune as extra strokes

        for i=1:qtprune(1)-1
            found=false;
            while ~found
                actualclass = strokerelation(queryidentifier(index));
                %strokes that were used in the query matching
                if(actualclass==1 || actualclass==0)
                    found=true;
                    classification(index) = 1;
                end
                prunedsize = prunedsize+queryall(index);
                index=index+1;
            end

        end
        
        %classify the first in the query as correct
        found=false;
        while ~found
            actualclass = strokerelation(queryidentifier(index));
            %strokes that were used in the query matching
            if(actualclass==1 || actualclass==0)
                found=true;
                classification(index) = 0;
                prunedsize = prunedsize-queryall(index);
            end
            prunedsize = prunedsize+queryall(index);
            index=index+1;
        end

        startindex=index-1;

        %classifymissingstrokes in beginning pruned portion
        currdistance=0;
        i=1;
        templatepiece=1;
        prunedtemplatesize = sum(template(1:qtprune(3)-1));

        while i<startindex && templatepiece < qtprune(3)

            actualclass = strokerelation(queryidentifier(i));
            %strokes that were not used in the query matching
            if ~(actualclass==1 || actualclass==0)
                distanceToPredictedMissing = ((prunedsize-currdistance) - sum(template(templatepiece:qtprune(3)-1)))/prunedtemplatesize;
                if(distanceToPredictedMissing > .5)
                    currdistance = currdistance+queryall(i);
                    i=i+1;
                elseif(distanceToPredictedMissing > -.5)
                    currdistance = currdistance+queryall(i);
                    classification(i) = -1;
                    i=i+1;
                else

                    templatepiece=templatepiece+1;

                end
            else
                currdistance = currdistance+queryall(i);
                i=i+1;
            end

        end



        sectionsize=0;
        sectionstart=startindex;
        queryindex=1;

        templatecomboindex = 1;
        %classify strokes that were matched 
        for i=qtprune(1):qtprune(2)
            found=false;
            while ~found

                sectionsize=sectionsize+queryall(index-1);
                actualclass = strokerelation(queryidentifier(index));
                %strokes that were used in the query matching
                if(actualclass==1 || actualclass==0)
                    found=true;
                    endsection = false;
                    if(i==qtprune(2))
                        classification(index) = 0;
                        endsection=true;
                    else
                        if(querycombo(queryindex)==0)
                            classification(index) = 0;
                            endsection=true;
                        else
                            classification(index) = 1;
                            querycombo(queryindex) = querycombo(queryindex) - 1;
                        end

                    end

                    %identify the missing strokes in the current section
                    if(endsection && queryindex<=length(querycombo))
                        
                        currdistance=0;



                        j=sectionstart;
                        templatepieces=0;

                        templateindex=qtprune(3) + sum((templatecombo(1:templatecomboindex-1) + 1));
                        templatedist = template(templateindex);

                        while j<index && ~templatecombo(templatecomboindex) == 0

                            actualclass = strokerelation(queryidentifier(j));
                            %strokes that were not used in the query matching
                            if ~(actualclass==1 || actualclass==0)

                                distanceToPredictedMissing = (currdistance - templatedist)/sectionsize;
                                if(distanceToPredictedMissing < -.2)
                                    currdistance = currdistance+queryall(j);
                                    j=j+1;
                                elseif(distanceToPredictedMissing <.2)
                                    currdistance = currdistance+queryall(j);
                                    classification(j) = -1;
                                    j=j+1;
                                else
                                    
                                    templatepieces=templatepieces+1;
                                    
                                    templateindex=qtprune(3) + sum((templatecombo(1:templatecomboindex-1)+1))+templatepieces;
                                    templatedist = templatedist+template(templateindex);
                                    j=j+1;

                                end
                             else
                                currdistance = currdistance+queryall(j);
                                j=j+1;
                                templatepieces=0;
                            end

                        end


                        templatecomboindex=templatecomboindex+1;
                        sectionsize=0;
                        sectionstart=index;
                        queryindex=queryindex+1;
                    end



                end

                index=index+1;
            end
        end


        endindex=index-1;
        %classify strokes in the query after the prunes as extra  
        for i=index:length(queryidentifier)

            actualclass = strokerelation(queryidentifier(i));
            %strokes that were used in the query matching
            if(actualclass==1 || actualclass==0)

                classification(i) = 1;
            end
        end



        %classifymissingstrokes in end pruned portion
        currdistance=0;
        i=endindex;
        templatepiece=qtprune(4)+1;
        prunedtemplatesize = sum(template(qtprune(4)+1:length(template)));
        while i<=length(queryidentifier) && templatepiece <= length(template)

            actualclass = strokerelation(queryidentifier(i));
            %strokes that were not used in the query matching
            if ~(actualclass==1 || actualclass==0)
                distanceToPredictedMissing = (currdistance - sum(template(qtprune(4)+1:templatepiece)))/prunedtemplatesize;
                if(distanceToPredictedMissing < -.5)
                    if(i<length(queryidentifier))
                        currdistance = currdistance+queryall(i);
                    end
                    i=i+1;
                elseif(distanceToPredictedMissing <.5)
                     if(i<length(queryidentifier))
                        currdistance = currdistance+queryall(i);
                    end
                    classification(i) = -1;
                    i=i+1;
                else

                    templatepiece=templatepiece+1;

                end
            else

                if(i<length(queryidentifier))
                    currdistance = currdistance+queryall(i);
                end
                i=i+1;
            end

        end
    end
%     queryall
% queryidentifier
% querycombo
% template
% templatecombo
% qtprune
% strokerelation
% classification
end


