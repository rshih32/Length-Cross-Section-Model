function [ error] = errmeasure3( query, template )
%ERRMEASURE Summary of this function goes here
%   Detailed explanation goes here
    n=5;
    query(query==0)=[];
    template(template==0)=[];
    error = cell(5,1);
    if(length(query>0) && length(template) > 0)
        [qsval, qsindex] = sort(query, 'descend');
        [tsval, tsindex] = sort(template, 'descend');
        if(length(query) > 5)
            query = query(qsindex(1:n));
        end
        if(length(template) > 5)
            template = template(tsindex(1:n));
        end
        errindex=1;
        error = cell(6,length(template)*(length(template)+1)/2 * length(query)*(length(query)+1)/2);
        for i=1:length(template)
            for j=1:length(template)-i+1
                for k=1:length(query)
                    for l=1:length(query)-k+1
                        newtemplate = template(i:length(template)-(j-1));
                        newquery = query(k:length(query) - (l-1));
                        scale=sum(newtemplate)/sum(newquery);
                        [results,tempquery,temptemplate,tempquerycombo, temptemplatecombo] = brutematch(scale*newquery, newtemplate, 1, 1, 0, zeros(1,length(query)),zeros(1,length(template)));
%                         [results,tempquery,temptemplate,tempquerycombo, temptemplatecombo] = dynamicerrmeasure(scale*newquery, newtemplate);
                        
                        error{1,errindex} = [scale;results];
                        error{2,errindex} = tempquery';
                        error{3,errindex} = temptemplate';
                        error{4,errindex} = tempquerycombo';
                        error{5,errindex} = temptemplatecombo';
                        error{6,errindex} = [k,length(query) - (l-1),i,length(template)-(j-1)]';
                        errindex=errindex+1;
                    end
                end
            end
        end
        
    else

    end
end

