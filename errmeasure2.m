function [ error] = errmeasure2( query, template )
%ERRMEASURE Summary of this function goes here
%   Detailed explanation goes here
    n=5;
    query(query==0)=[];
    template(template==0)=[];
    error = cell(5,3);
    if(length(query>0) && length(template) > 0)
        [qsval, qsindex] = sort(query, 'descend');
        [tsval, tsindex] = sort(template, 'descend');
        if(length(query) > 5)
            query = query(qsindex(1:n));
        end
        if(length(template) > 5)
            template = template(tsindex(1:n));
        end
        
        scale=sum(template)/sum(query);
        [results,tempquery,temptemplate,tempquerycombo, temptemplatecombo] = brutematch(scale*query, template, 1, 1, 0, zeros(1,length(query)),zeros(1,length(template)));
        error{1,1} = [scale;results];
        error{2,1} = tempquery;
        error{3,1} = temptemplate;
        error{4,1} = tempquerycombo';
        error{5,1} = temptemplatecombo';
        if(length(template) > 1)
            newtemplate = template(2:length(template));
            scale=sum(newtemplate)/sum(query);
            [results,tempquery,temptemplate,tempquerycombo, temptemplatecombo] = brutematch(scale*query, newtemplate, 1, 1, 0, zeros(1,length(query)),zeros(1,length(template)));
            error{1,2} = [scale;results];
            error{2,2} = tempquery;
            error{3,2} = temptemplate;
            error{4,2} = tempquerycombo';
            error{5,2} = temptemplatecombo';
            newtemplate = template(1:length(template)-1);
            scale=sum(newtemplate)/sum(query);
            [results,tempquery,temptemplate,tempquerycombo, temptemplatecombo] = brutematch(scale*query, newtemplate, 1, 1, 0, zeros(1,length(query)),zeros(1,length(template)));
            error{1,3} = [scale;results];
            error{2,3} = tempquery;
            error{3,3} = temptemplate;
            error{4,3} = tempquerycombo';
            error{5,3} = temptemplatecombo';
        end
%         if(length(template) > 2)
%             newtemplate = template(2:length(template)-1);
%             scale=sum(newtemplate)/sum(query);
%             [results,tempquery,temptemplate] = brutematch(scale*query, newtemplate, 1, 1, 0);
%         end
%         error = results;
%         finalquery = tempquery;
%         finaltemplate = temptemplate;
    else
%         error = 0;
%         finalquery = query;
%         finaltemplate = template;
    end
end

