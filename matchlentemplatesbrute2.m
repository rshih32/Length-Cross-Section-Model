function [ matchvotes,matchstartintervalscale, qtcomboinfo] = matchlentemplatesbrute2( querytemplate, fullrotationtemplates, rotation )
%MATCHLENTEMPLATES Summary of this function goes here
%   Detailed explanation goes here

% x = find(any(querytemplate,2),1,'first'):find(any(querytemplate,2),1,'last');
% y = find(any(querytemplate),1,'first'):find(any(querytemplate),1,'last');
% querytemplate = querytemplate(x, y);
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

qtcomboinfo = cell(numrotations, numslices, 6);


bestscalevoting=[];
rotation
mostvotes = 0;
template = fullrotationtemplates(:,:,rotation);
x = find(any(template,2),1,'first'):find(any(template,2),1,'last');
y = find(any(template),1,'first'):find(any(template),1,'last');
trimmedtemplate = template(x, y);
[rowdim,coldim] = size(trimmedtemplate);

padrowdim=int32(rowdim*1.5);
templatestart = int32(rowdim*.25);
templateend = templatestart+rowdim-1;
paddedtemplate = zeros(padrowdim, coldim);
paddedtemplate(templatestart:templateend,:) = trimmedtemplate;
trimmedtemplate=paddedtemplate;
[rowdim,coldim] = size(trimmedtemplate);

maxinterval = floor(rowdim/numslices);
newquerytemplate = zeros(numslices, coldim);
newquerytemplate(:,1:querycoldim) = querytemplate;

savedscalevoting = cell(numslices, rowdim);


maxcontributor = zeros(rowdim, numslices, scaleresolution+10);
comboinfo = cell(scaleresolution+10, rowdim, numslices, 6);
tic
for theslice=1:numslices
    for therow=1:rowdim
        tempscalevoting = zeros(1,scaleresolution+10);
        if(therow>=templatestart && therow <=templateend && any(newquerytemplate(theslice,:)))
            errmeasures=errmeasure3(newquerytemplate(theslice,:), trimmedtemplate(therow,:));

            cols = size(errmeasures,2);



            for col=1:cols
                scaleresult = errmeasures{1,col};
                querymod = errmeasures{2,col};
                templatemod = errmeasures{3,col};
                querycombo = errmeasures{4,col};
                templatecombo = errmeasures{5,col};
                qtprune = errmeasures{6,col};
                totalpieces = length(querycombo) + length(templatecombo);
                percentunmodified = (totalpieces-sum(querycombo)-sum(templatecombo));
                %cols 2 and 3 have 1 piece of the template removed

                percentunmodified = percentunmodified - (length(querycombo)-length(querymod)) - (length(templatecombo)-length(templatemod));

                percentunmodified = percentunmodified / totalpieces;

                votes = smoothfactor*parsing.gauss(scaleresult(2),0,.5)*parsing.gauss(1,percentunmodified,3/5);


                index = round((log(scaleresult(1))-minscale)/stepsize)+6;


                if(index >5 && index < scaleresolution+6)
                    %tempscalevoting(index-5:index+5)= max(tempscalevoting(index-5:index+5),votes);

                    for subindex=index-5:index+5
                        if votes(subindex -(index-5) + 1) > maxcontributor(therow, theslice, subindex)
                            tempscalevoting(subindex) = votes(subindex -(index-5) + 1);
                            maxcontributor(therow, theslice, subindex)=tempscalevoting(subindex);
                            comboinfo{subindex,therow, theslice, 1} = querymod;
                            comboinfo{subindex,therow, theslice, 2} = templatemod;
                            comboinfo{subindex,therow, theslice, 3} = querycombo;
                            comboinfo{subindex,therow, theslice, 4} = templatecombo;
                            comboinfo{subindex,therow, theslice, 5} = qtprune;
                            comboinfo{subindex,therow, theslice, 6} = trimmedtemplate(therow,:);
                        end
                    end
                end
            end

        end
        savedscalevoting{theslice,therow}= tempscalevoting;
    end
end

% scalevalues(scalevalues==0)=[];

toc

for interval = 1:maxinterval

    for startpoint = 1:rowdim-interval*numslices+1

        scalevoting = zeros(1,scaleresolution+10);
        for theslice=1:numslices


            scalevoting = scalevoting + savedscalevoting{theslice, startpoint+(theslice-1)*interval};

        end
        [topvote,index] = max(scalevoting);

        topvote = topvote * parsing.gauss(interval/maxinterval,1,3/5);
        if(topvote>mostvotes)
            bestscalevoting = scalevoting;
            mostvotes  = topvote;
            matchvotes(1,rotation) = mostvotes;
            matchstartintervalscale(1,rotation)=startpoint;
            matchstartintervalscale(2,rotation)=interval;
            matchstartintervalscale(3,rotation)=exp((index-6)*stepsize + minscale);
            for theslice=1:numslices
                therow = startpoint+(theslice-1)*interval;
                cbi = comboinfo(index, startpoint+(theslice-1)*interval, theslice, :);
                offset = 1;
                if ~any(newquerytemplate(theslice,:))
                    comboinfo{index, startpoint+(theslice-1)*interval, theslice, 6}=trimmedtemplate(therow,:);
                    cbi = comboinfo(index, startpoint+(theslice-1)*interval, theslice, :);
                elseif(therow>=templatestart && therow <=templateend)
                    while(isempty(cbi{1,1}))
                        if(index+offset <=length(scalevoting))
                            cbi = comboinfo(index+offset, startpoint+(theslice-1)*interval, theslice, :);
                        end
                        if(isempty(cbi{1,1}) && index-offset > 0)
                            cbi = comboinfo(index-offset, startpoint+(theslice-1)*interval, theslice, :);
                        end
                        offset=offset+1;
                    end
                end
                qtcomboinfo(rotation, theslice,:) = cbi;
            end
        end
    end
end
toc



end

