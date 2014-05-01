function [results,finalquery, finaltemplate,finalquerycombo, finaltemplatecombo] = brutematch(query, template, queryindex, templateindex, allowabledirection, querycombo, templatecombo)
%BRUTEMATCH Summary of this function goes here
   
    querylength = length(query);
    templatelength = length(template);
    
    if(queryindex==querylength || templateindex == templatelength)
        
        newquerycombo = querycombo;
        newtemplatecombo = templatecombo;
        if(queryindex < querylength)
            prefix = [];
            if(queryindex > 1)
                prefix = query(1:queryindex-1);
            end
            suffix = sum(query(queryindex:querylength));
            query = [prefix, suffix];
            
            newquerycombo(queryindex) = querycombo(queryindex) + (querylength-queryindex);
        end
        if(templateindex < templatelength)
            prefix = [];
            if(templateindex > 1)
                prefix = template(1:templateindex-1);
            end
            suffix = sum(template(templateindex:templatelength));
            template = [prefix, suffix];
            
            newtemplatecombo(templateindex) = templatecombo(templateindex) + (templatelength-templateindex);
        end
        results = sum(abs(query-template)./template)/templatelength;
        
        finalquery = query;
        finaltemplate = template;
        finalquerycombo = newquerycombo;
        finaltemplatecombo = newtemplatecombo;
    else
        
        results = intmax;
        if(allowabledirection == 0 || allowabledirection == 1)
            if(querylength-queryindex == 1) 
                prefix = template(1:templateindex);
                suffix = sum(template(templateindex+1:templatelength));                
                newtemplate = [prefix, suffix];
                newtemplatecombo = templatecombo;
                newtemplatecombo(templateindex+1) = templatecombo(templateindex+1) + (templatelength-templateindex-1);
               
                [tempresults,tempquery, temptemplate,tempquerycombo,temptemplatecombo]=brutematch(query, newtemplate, queryindex+1, templateindex+1, 0, querycombo, newtemplatecombo);
            else
                prefix=[];
                if(queryindex > 1)
                    prefix = query(1:queryindex-1);
                end
                suffix = [];
                if(querylength - queryindex>=2)
                    suffix = query(queryindex+2:querylength);
                end
                
                newquery = [prefix, query(queryindex)+query(queryindex+1), suffix];
                newquerycombo = querycombo;
                newquerycombo(queryindex) = querycombo(queryindex) + 1;
               
                [tempresults,tempquery, temptemplate,tempquerycombo,temptemplatecombo]=brutematch(newquery, template, queryindex, templateindex, 1, newquerycombo, templatecombo);
            end
            if tempresults < results
                results = tempresults;
                finalquery = tempquery;
                finaltemplate = temptemplate;
                finalquerycombo = tempquerycombo;
                finaltemplatecombo = temptemplatecombo;
            end
        end
        if(allowabledirection == 0 || allowabledirection == 2)
            if(templatelength-templateindex == 1) 
                prefix = query(1:queryindex);
                suffix = sum(query(queryindex+1:querylength));                
                newquery = [prefix, suffix];
                newquerycombo = querycombo;
                newquerycombo(queryindex+1) = querycombo(queryindex+1) + (querylength-queryindex-1);
                
                [tempresults,tempquery, temptemplate,tempquerycombo,temptemplatecombo]=brutematch(newquery, template, queryindex+1, templateindex+1, 0, newquerycombo, templatecombo);
            else
                prefix=[];
                if(templateindex > 1)
                    prefix = template(1:templateindex-1);
                end
                suffix = [];
                if(templatelength - templateindex>=2)
                    suffix = template(templateindex+2:templatelength);
                end
                newtemplate = [prefix, template(templateindex)+template(templateindex+1), suffix];
                newtemplatecombo = templatecombo;
                newtemplatecombo(templateindex) = templatecombo(templateindex) + 1;
                
                [tempresults,tempquery, temptemplate,tempquerycombo,temptemplatecombo]=brutematch(query, newtemplate, queryindex, templateindex, 2, querycombo, newtemplatecombo);
            end
            if tempresults < results
                results = tempresults;
                finalquery = tempquery;
                finaltemplate = temptemplate;
                finalquerycombo = tempquerycombo;
                finaltemplatecombo = temptemplatecombo;
            end
        end
        if(~(templatelength-templateindex == 1) && ~(querylength-queryindex == 1))
          
            [tempresults,tempquery, temptemplate,tempquerycombo,temptemplatecombo]=brutematch(query, template, queryindex + 1, templateindex + 1, 0, querycombo, templatecombo);
            if tempresults < results
                results = tempresults;
                finalquery = tempquery;
                finaltemplate = temptemplate;
                finalquerycombo = tempquerycombo;
                finaltemplatecombo = temptemplatecombo;
            end
        end
    end
    

end

