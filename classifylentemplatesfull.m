function [ matchvotes,matchstartintervalscale ] = classifylentemplatesfull( inputexample, numslices, ANDlentemplate, NANDlentemplate, ORlentemplate, NORlentemplate, NOTlentemplate, XORlentemplate, ANDrotations, NANDrotations, ORrotations, NORrotations, NOTrotations, XORrotations)
%CLASSIFYLENTEMPLATESFULL Summary of this function goes here
%   Detailed explanation goes here
templatedim=300;
stdv=50;
numrotations=18;
example = zeros(templatedim,templatedim,3);
rawstrokes=inputexample;
% for rotation=1:5
%     
%     %for all angles
%     angle = 2*pi/numrotations;
%     Rotate = [cos(angle), -sin(angle); sin(angle),cos(angle)];
%     for j = 1: length(rawstrokes)
%         rawstroke = rawstrokes{j};
%         rawstroke = Rotate * rawstroke;
%         
%         rawstrokes{j} = rawstroke;
%     end
% end
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
%figure;
%image(example);
querytemplate = templatelengthspartial(example,numslices);
%parsing.viewLengthTemplate(querytemplate);


[matchvotes,matchstartintervalscale] = matchlentemplatesbrute( querytemplate, XORlentemplate );
% figure;
% plot(matchvotes);
% saveas(gcf,'pics/lenmatch2/NOTmatchvotes.jpg');
% for rotation=1:length(matchvotes)
% [votes,rotation]=max(matchvotes)
% matchvotes(rotation)
rotation = 1;

startintervalscale = matchstartintervalscale(:,rotation)
% votes = matchvotes(1)
% startintervalscale=[112,1,.6491];
parsing.viewMatchedLengthTemplate(querytemplate, XORlentemplate(:,:,rotation), startintervalscale(1), startintervalscale(2), startintervalscale(3));
% saveas(gcf,'pics/lenmatch2/NOTbestmatch.jpg');

% [votes,rotation]=max(matchvotes.*logical(ANDrotations));
% parsing.viewMatchedLengthTemplate(querytemplate, NOTlentemplate(:,:,rotation), startintervalscale(1), startintervalscale(2), startintervalscale(3));
% saveas(gcf,'pics/lenmatch2/NOTbestmatch2.jpg');

% matchvotes(1)
% startintervalscale = matchstartintervalscale(:,1)
% parsing.viewMatchedLengthTemplate(querytemplate, NOTlentemplate(:,:,1), startintervalscale(1), startintervalscale(2), startintervalscale(3));
% saveas(gcf,'pics/lenmatch2/NOTcorrmatch.jpg');

% parsing.viewMatchedLengthTemplate(querytemplate, NOTlentemplate(:,:,1), 35, 15, 1.42);
% end
% 
% [matcherror,matchstartintervalscale] = matchlentemplates( querytemplate, NANDlentemplate );
% [error,rotation]=min(matcherror)
% startintervalscale = matchstartintervalscale(:,rotation);
% parsing.viewMatchedLengthTemplate(querytemplate, NANDlentemplate(:,:,rotation), startintervalscale(1), startintervalscale(2), startintervalscale(3));
% 
% [matcherror,matchstartintervalscale] = matchlentemplates( querytemplate, XORlentemplate );
% [error,rotation]=min(matcherror)
% startintervalscale = matchstartintervalscale(:,rotation);
% parsing.viewMatchedLengthTemplate(querytemplate, XORlentemplate(:,:,rotation), startintervalscale(1), startintervalscale(2), startintervalscale(3));


end

