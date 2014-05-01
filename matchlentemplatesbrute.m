function [ matchvotes,matchstartintervalscale ] = matchlentemplatesbrute( querytemplate, fullrotationtemplates )
%MATCHLENTEMPLATES Summary of this function goes here
%   Detailed explanation goes here

x = find(any(querytemplate,2),1,'first'):find(any(querytemplate,2),1,'last');
y = find(any(querytemplate),1,'first'):find(any(querytemplate),1,'last');
querytemplate = querytemplate(x, y);
smoothfactor = zeros(1,5);
smoothfactor(1) = parsing.gauss(2,0,1);
smoothfactor(11) = smoothfactor(1);
smoothfactor(2) = parsing.gauss(1.6,0,1);
smoothfactor(10) = smoothfactor(2);
smoothfactor(3) = parsing.gauss(1.2,0,1);
smoothfactor(9) = smoothfactor(3);
smoothfactor(4) = parsing.gauss(.8,0,1);
smoothfactor(8) = smoothfactor(4);
smoothfactor(5) = parsing.gauss(.4,0,1);
smoothfactor(6) = smoothfactor(5);
smoothfactor(7) = parsing.gauss(0,0,1);
minscale = log(.001);
maxscale = log(100);
scaleresolution = 250;
stepsize = (maxscale-minscale)/(scaleresolution-1);
    
[fullrowdim,fullcoldim, numrotations] = size(fullrotationtemplates);
matchvotes = zeros(1,numrotations);
matchstartintervalscale = zeros(3,numrotations);
[numslices,querycoldim] = size(querytemplate);

for rotation = 1: numrotations
    bestscalevoting=[];
    rotation
    mostvotes = 0;
    template = fullrotationtemplates(:,:,rotation);
    x = find(any(template,2),1,'first'):find(any(template,2),1,'last');
    y = find(any(template),1,'first'):find(any(template),1,'last');
    trimmedtemplate = template(x, y);
    [rowdim,coldim] = size(trimmedtemplate);
    
    maxinterval = floor(rowdim/numslices);
    newquerytemplate = zeros(numslices, coldim);
    newquerytemplate(:,1:querycoldim) = querytemplate;
    %queryavg = mean(mean(newquerytemplate));
    
    savederror=cell(numslices, rowdim);
    %scalevalues=zeros(3*numslices*rowdim);
    %scalevalueindex=1;
    for theslice=1:numslices
        for therow=1:rowdim
            errmeasures=errmeasure2(newquerytemplate(theslice,:), trimmedtemplate(therow,:));
            savederror{theslice,therow}=errmeasures;
            %errmeasuremat = [ errmeasures{1,1}, errmeasures{1,2}, errmeasures{1,3}];
           % if length(errmeasuremat) > 0
           %     scalevalues(scalevalueindex:scalevalueindex+length(errmeasuremat(1,:))-1) = errmeasuremat(1,:);
            %    scalevalueindex=scalevalueindex+length(errmeasuremat(1,:));
           % end
        end
    end
    
   % scalevalues(scalevalues==0)=[];
    
    
        
    for interval = 1:maxinterval

        for startpoint = 1:rowdim-interval*numslices+1
            
            scalevoting = zeros(1,scaleresolution+10);
            
            for theslice=1:numslices
                errmeasures = savederror{theslice, startpoint+(theslice-1)*interval};
               
                errmeasuremat = [ errmeasures{1,1}, errmeasures{1,2}, errmeasures{1,3}];
                querycombomat = [ errmeasures{4,1}, errmeasures{4,2}, errmeasures{4,3}];
                templatecombomat = [ errmeasures{5,1}, errmeasures{5,2}, errmeasures{5,3}];
                [rows,cols] = size(errmeasuremat);
                tempscalevoting = zeros(1,scaleresolution+10);
                
                for col=1:cols
                    querycombo = querycombomat(:,col);
                    templatecombo = templatecombomat(:,col);
                    totalpieces = length(querycombo) + length(templatecombo);
                    percentunmodified = (totalpieces-sum(querycombo)-sum(templatecombo));
                    %cols 2 and 3 have 1 piece of the template removed
                    if col ~= 1
                        percentunmodified = percentunmodified - 1;
                    end
                    percentunmodified = percentunmodified / totalpieces;
                    votes = smoothfactor*parsing.gauss(errmeasuremat(2,col),0,.5)*parsing.gauss(1,percentunmodified,3/5);
                    
                    
                    index = round((log(errmeasuremat(1,col))-minscale)/stepsize)+6;
                    if(index >5 && index < scaleresolution+6)
                        tempscalevoting(index-5:index+5)= max(tempscalevoting(index-5:index+5),votes);
                        
                    end
                end
%                 if (rotation==1 && startpoint==2 && interval==13 && theslice == 10)
%                     figure;
%                     plot(tempscalevoting);
%                 end
                scalevoting = scalevoting + tempscalevoting;
            end
            [topvote,index] = max(scalevoting);
%             if (rotation==1 && startpoint==10 && interval==14)
%             
%                 figure;
%                 plot(scalevoting);
%                 exp((index-6)*stepsize + minscale)
%             end
            topvote = topvote * parsing.gauss(interval/maxinterval,1,3/5);
            if(topvote>mostvotes)
                bestscalevoting = scalevoting;
                mostvotes  = topvote;
                matchvotes(1,rotation) = mostvotes;
                matchstartintervalscale(1,rotation)=startpoint;
                matchstartintervalscale(2,rotation)=interval;
                matchstartintervalscale(3,rotation)=exp((index-6)*stepsize + minscale);
            end
        end
    end
%     if(rotation == 1)
%         figure;
        
%         exp((index-6)*stepsize + minscale)
        
%         plot(bestscalevoting);
%         saveas(gcf,'pics/lenmatch2/NOTvotes.jpg');
%     end
    %matchvotes(1,rotation)
    %matchstartintervalscale(:,rotation)
end
end

