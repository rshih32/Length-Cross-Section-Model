function [ results,finalquery, finaltemplate,finalquerycombo, finaltemplatecombo ] = dynamicerrmeasure( query, template )
%DYNAMICERRMEASURE Summary of this function goes here
%   Detailed explanation goes here
    querylength = length(query);
    templatelength = length(template);
    Bestmatches=zeros(querylength,templatelength, 2);
    %(:,:,1) signifies query pieces can be combined
    %(:,:,2) signifies template pieces can be combined
    sectionstarts=cell(querylength,templatelength, 2);
    
    firstsectionstart = zeros(max(querylength,templatelength),2);
    firstsectionstart(1,:) = ones(1,2);
    sectionstarts{1,1,1} = firstsectionstart;
    
    sectionstarts{1,1,2} = firstsectionstart;
    for i=1:querylength
        for j=1:templatelength
                
                %only j (template) is being combined
                if i == 1
                    
                    sectionstarts{i,j,1} = sectionstarts{1,1,1};
                    sectionstarts{i,j,2} = sectionstarts{1,1,2};
                    Bestmatches(i,j,1) = intmax;
                    q=query(1);
                    t=sum(template(1:j));
                    if(t>q)
                        Bestmatches(i,j,2) = (t-q)/t;
                        
                    end
                %only i (query) is being combined
                elseif j == 1
                    sectionstarts{i,j,1} = sectionstarts{1,1,1};
                    sectionstarts{i,j,2} = sectionstarts{1,1,2};
                    Bestmatches(i,j,2) = intmax;
                    q=sum(query(1:i));
                    t=template(1);
                    if(q>t)
                        Bestmatches(i,j,1) = (q-t)/t;
                    end
                else
                    
                    newpiece1 = Bestmatches(i-1,j-1,1);
                    
                    sectioninfo1 = sectionstarts{i-1,j-1,1};
                    querystarts = sectioninfo1(:,1);
                    querystart = find(querystarts==0,1)-1;
                    qpiece = sum(query(querystart:i-1));
                    if(qpiece < template(j-1))
                        cost1 = (template(j-1)-qpiece)/template(j-1) + newpiece1;
                    else
                        cost1=newpiece1;
                    end
                    if(query(i) > template(j)||(i==querylength && j == templatelength))
                        cost1=cost1+(query(i)-template(j))/template(j);
                    end
                    
                    newpiece2 = Bestmatches(i-1,j-1,2);
                    
                    sectioninfo2 = sectionstarts{i-1,j-1,2};
                    templatestarts = sectioninfo2(:,2);
                    templatestart = find(templatestarts==0,1)-1;
                    tpiece = sum(template(templatestart:j-1));
                    if(query(i-1) > tpiece)
                        cost2 = (query(i-1) - tpiece)/tpiece + newpiece2;
                    else
                        cost2=newpiece2;
                    end
                    if(template(j) > query(i)||(i==querylength && j == templatelength))
                        cost2=cost2+(template(j)-query(i))/template(j);
                    end
                    
                    contquery = Bestmatches(i-1,j,1);
                    
                    sectioninfoq = sectionstarts{i-1,j,1};
                    
                    querystarts = sectioninfoq(:,1);
                    querystart = find(querystarts==0,1)-1;
                    qpiece1 = sum(query(querystart:i-1));
                    qpiece2 = qpiece1+query(i);
                    if(qpiece2>template(j))
                        if(qpiece1<template(j))
                            contquery = contquery + (qpiece2-template(j))/template(j);
                        else
                            contquery = contquery + query(i)/template(j);
                        end
                    elseif (i==querylength && j == templatelength)
                        finalquerycost = (template(j)-qpiece2)/template(j);
                        contquery = contquery + finalquerycost;
                    end
                    
                    
                    conttemplate = Bestmatches(i,j-1,2);
                    sectioninfot = sectionstarts{i,j-1,2};
                    templatestarts = sectioninfot(:,2);
                    templatestart = find(templatestarts==0,1)-1;
                     tpiece1= sum(template(templatestart:j-1));
                     tpiece2 = tpiece1+ template(j);
                     if(tpiece2>query(i))
                         if(tpiece1<query(i))
                             conttemplate = conttemplate + (tpiece2-query(i))/tpiece2;
                         else
                            conttemplate = conttemplate + query(i)*template(j)/(tpiece2*tpiece1);
                         end
                     elseif(i==querylength && j == templatelength)
                         finaltemplatecost = (query(i) - tpiece2)/tpiece2;
                         conttemplate = conttemplate + finaltemplatecost;
                    end
                    
                    
                    querychoice = [cost1,cost2, contquery];
                    
                    [minval,minindex] = min(querychoice);
                    if(minindex == 1)
                        Bestmatches(i,j,1) = cost1;
                        tempsectioninfo = sectioninfo1;
                        tempsectioninfo(find(tempsectioninfo(:,1)==0,1),1) = i;
                        tempsectioninfo(find(tempsectioninfo(:,2)==0,1),2) = j;
                        sectionstarts{i,j,1} = tempsectioninfo;
                    elseif(minindex == 2)
                        Bestmatches(i,j,1) = cost2;
                        tempsectioninfo = sectioninfo2;
                        tempsectioninfo(find(tempsectioninfo(:,1)==0,1),1) = i;
                        tempsectioninfo(find(tempsectioninfo(:,2)==0,1),2) = j;
                        sectionstarts{i,j,1} = tempsectioninfo;
                    else
                        Bestmatches(i,j,1) = contquery;
                        sectionstarts{i,j,1} = sectionstarts{i-1,j,1};
                        
                    end
                    
                    
                    
                    
                    templatechoice = [cost1,cost2, conttemplate];
                    [minval,minindex] = min(templatechoice);
                     if(minindex == 1)
                        Bestmatches(i,j,2) = cost1;
                        tempsectioninfo = sectioninfo1;
                        tempsectioninfo(find(tempsectioninfo(:,1)==0,1),1) = i;
                        tempsectioninfo(find(tempsectioninfo(:,2)==0,1),2) = j;
                        sectionstarts{i,j,2} = tempsectioninfo;
                    elseif(minindex == 2)
                        Bestmatches(i,j,2) = cost2;
                        tempsectioninfo = sectioninfo2;
                        tempsectioninfo(find(tempsectioninfo(:,1)==0,1),1) = i;
                        tempsectioninfo(find(tempsectioninfo(:,2)==0,1),2) = j;
                        sectionstarts{i,j,2} = tempsectioninfo;
                    else
                        Bestmatches(i,j,2) = conttemplate;
                        sectionstarts{i,j,2} = sectionstarts{i,j-1,2};
                        
                    end
                end

        end
    end
%     sectionstarts{length(query),length(template),1}
%     sectionstarts{length(query),length(template),2}
%     query
%     template
%     Bestmatches(Bestmatches>1000)=99;
%     Bestmatches
    
    if(Bestmatches(querylength,templatelength,1) < Bestmatches(querylength,templatelength,2))
        combo=sectionstarts{querylength,templatelength,1};
    else
        combo=sectionstarts{querylength,templatelength,2};
    end
    
   
    
    qc=combo(:,1);
    tc=combo(:,2);
    qclength = length(find(qc));
    tclength = length(find(tc));
    finalquery=zeros(1,qclength);
    finaltemplate=zeros(1,tclength);
    finalquerycombo=zeros(1,querylength);
    finaltemplatecombo=zeros(1,templatelength);
    
    for i=2:qclength
        numcombined = qc(i)-qc(i-1)-1;
        finalquerycombo(i-1) = numcombined;
        finalquery(i-1) = sum(query(qc(i-1):qc(i)-1));
    end
    
    finalquerycombo(qclength) = querylength-qc(qclength);
    finalquery(qclength) = sum(query(qc(qclength):querylength));
   
    
    for i=2:tclength
        numcombined = tc(i)-tc(i-1)-1;
        finaltemplatecombo(i-1) = numcombined;
        finaltemplate(i-1) = sum(template(tc(i-1):tc(i)-1));
    end
   
    finaltemplatecombo(tclength) = templatelength-tc(tclength);
    finaltemplate(tclength) = sum(template(tc(tclength):templatelength));
    
    results = sum(abs(finalquery-finaltemplate)./finaltemplate)/length(finaltemplate);
end

