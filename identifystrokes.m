function [ accuracy,incpercentmatrix,corpercentmatrix,classresult ] = identifystrokes( inputexample, strokerelation, numslices, lentemplate)
%CLASSIFYLENTEMPLATESFULL Summary of this function goes here
%   Detailed explanation goes here
templatedim=300;
stdv=50;
numrotations=18;
example = zeros(templatedim,templatedim,3);
rawstrokes=inputexample;

rawstrokes2=rawstrokes;

for rotation=1:15
    
    %for all angles
    angle = 2*pi/numrotations;
    Rotate = [cos(angle), -sin(angle); sin(angle),cos(angle)];
    for j = 1: length(rawstrokes2)
        rawstroke = rawstrokes2{j};
        rawstroke = Rotate * rawstroke;
        
        rawstrokes2{j} = rawstroke;
    end
end

[votes1,classresult1] = identifystrokeshelper( rawstrokes, strokerelation, numslices, lentemplate, 1 );
 [votes2,classresult2] = identifystrokeshelper( rawstrokes2, strokerelation, numslices, lentemplate, 15 );

votes=votes1+votes2;
classresult=classresult1+classresult2;
% votes=votes1;
% classresult=classresult1;

%firstrow is numcorrect
%secondrow is total count
accuracy = zeros(2,4);
incpercentmatrix = zeros(length(strokerelation),5);
incindex=1;
corpercentmatrix = zeros(length(strokerelation),5);
corindex=1;
for i=1:length(strokerelation)
    thevote = votes(i,:);
    percents=thevote/sum(thevote);
    [maxval,maxindex] = max(thevote);
    if(maxindex==2&&thevote(2)==thevote(3))
        maxindex=3;
    end
    %if a stroke has no votes classify it as part of the sketch if in the
    %query, otherwise not part of the sketch
    if(maxval == 0)
        if(strokerelation(i) == 0 || strokerelation(i) == 1)
            maxindex = 2;
        else
            maxindex = 4;
        end
    end
    accuracy(2,strokerelation(i)+2) =accuracy(2,strokerelation(i)+2)+1;
    if(strokerelation(i) == maxindex - 2)
        accuracy(1,strokerelation(i)+2) =accuracy(1,strokerelation(i)+2)+1;
        corpercentmatrix(corindex, :) = [maxindex percents];
    else
        incpercentmatrix(incindex, :) = [maxindex percents];
    end  
    
%     if(maxindex==1 || maxindex == 2)
%         instrokes(i) = 1;
%     end
end
corpercentmatrix(all(corpercentmatrix==0,2),:)=[];
incpercentmatrix(all(incpercentmatrix==0,2),:)=[];

% classresult = 0;
% for i=1:numslices
% %     qta = querytemplateall(i,:)*matchstartintervalscale(3,rotation);
% %     qstrokeidentifiers = querytemplatestrokeidentifierall(i,:);
% %     newquery=zeros(1,length(qta));
% %     index=1;
% %     foundfirst=false;
% %     for j=1:length(qstrokeidentifiers)
% %         if qstrokeidentifiers(j) ~= 0 
% %             if ~foundfirst
% %                 
% %                 if instrokes(qstrokeidentifiers(j))
% %                     
% %                     foundfirst=true;
% %                 end
% %             else
% %                 newquery(index) = newquery(index) + qta(j-1);
% %                 if instrokes(qstrokeidentifiers(j))
% %                     index=index+1;
% %                 end
% %             end
% %         end
% %     end
%     
%     newquery=qtcomboinfo{rotation,i,1};
%     
%     
%     newquery=newquery(newquery~=0);
%     %newtemplate = qtcomboinfo{rotation,i,6};
%     newtemplate=qtcomboinfo{rotation,i,2};
%     newtemplate=newtemplate(newtemplate~=0);
%     tempquerycombo=qtcomboinfo{rotation,i,3};
%     temptemplatecombo=qtcomboinfo{rotation,i,4};
%     if any(newquery) && any(newtemplate)
%         
%         results = sum(abs(newquery-newtemplate)./newtemplate)/length(newtemplate);
% %         [results,tempquery,temptemplate,tempquerycombo, temptemplatecombo] = brutematch(newquery, newtemplate, 1, 1, 0, zeros(1,length(newquery)),zeros(1,length(newtemplate)));
%         totalpieces = length(tempquerycombo) + length(temptemplatecombo);
%         percentunmodified = (totalpieces-sum(tempquerycombo)-sum(temptemplatecombo));
%         %cols 2 and 3 have 1 piece of the template removed
% 
%         percentunmodified = percentunmodified - (length(tempquerycombo)-length(newquery)) - (length(temptemplatecombo)-length(newtemplate));
% 
%         percentunmodified = percentunmodified / totalpieces;
% 
% 
%         classresult = classresult +  parsing.gauss(results,0,.5)*parsing.gauss(1,percentunmodified,3/5);
%     end
% %classification = classifyLengthPiece( querytemplateall(i,:)*matchstartintervalscale(3,rotation), querytemplatestrokeidentifierall(i,:), qtcomboinfo{rotation,i,3}, qtcomboinfo{rotation,i,6}, qtcomboinfo{rotation,i,4},  qtcomboinfo{rotation,i,5}, strokerelation );
% end
% x = find(any(lentemplate(:,:,rotation),2),1,'first'):find(any(lentemplate(:,:,rotation),2),1,'last');
% maxinterval = floor((max(x)-min(x))*1.5/numslices);
% classresult=classresult* parsing.gauss(matchstartintervalscale(2,rotation)/maxinterval,1,3/5)/numslices;

% accuracy=0;
% for i=1:length(strokerelation)
%     [maxval,maxindex] = max(votes(i,:));
%     if(strokerelation(i) == maxindex - 2)
%         accuracy=accuracy+1;
%     end
% end
% accuracy=accuracy/length(strokerelation)



% % figure;
% % plot(matchvotes);
% % saveas(gcf,'pics/lenmatch2/NOTmatchvotes.jpg');
% % for rotation=1:length(matchvotes)
% % [votes,rotation]=max(matchvotes)
% % matchvotes(rotation)
%  rotation = 1;
%  
%  startintervalscale = matchstartintervalscale(:,rotation)
 % votes = matchvotes(1)
 % startintervalscale=[112,1,.6491];
%  parsing.viewMatchedLengthTemplate(querytemplate, lentemplate(:,:,rotation), startintervalscale(1), startintervalscale(2), startintervalscale(3));


end

