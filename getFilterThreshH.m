function [threshhold] = getFilterThreshH( example, filterfamily )
%FILTERCONVLENGTH Summary of this function goes here
%   Detailed explanation goes here
    threshhold = zeros(1,length(filterfamily));
    [a,b]=size(example);
    start=1;
	for filternum=1:length(filterfamily)
        max=0;
        for i=start:b
            filter=filterfamily{filternum};
            pfilter=filter(:,:,2);
            nfilter=filter(:,:,3);
            [af,bf]=size(pfilter);
            
            if(i+bf-1 <= b)
                window=example(:,i:i-1 + bf);         
                val=(sum(sum(pfilter.*window))-sum(sum(nfilter.*window)));
                if(val > max)
                    max=val;
                    start = i + 1;
                end
            end
        end
        threshhold(filternum) = max;
	end
end
 

