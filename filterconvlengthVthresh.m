function [len, avgpp] = filterconvlengthVthresh( example, filterfamily , Vthresh)
%FILTERCONVLENGTH Summary of this function goes here
%   Detailed explanation goes here
    [a,b]=size(example);
    phase=0;
    avgpp=0;
    start=0;
    theend=0;
    canproceed=false;
    
   
    for i=1:a
   
        val1=0;
        val2=0;

        if(phase == 0)
            filter2=filterfamily{1};
            pfilter2=filter2(:,:,2);
            nfilter2=filter2(:,:,3);
            [af2,bf2]=size(pfilter2);
            
            if(i+af2-1 <= a)
                window=example(i:i-1 + af2,:);      
                
                val2=(sum(sum(pfilter2.*window))-sum(sum(nfilter2.*window)));

                if(sum(sum(window))==0)
                    val2=0;
                end
    
                if val2 > Vthresh(1)
                    start=i;
                    phase=1;
      
                end
                avgpp = avgpp+val2;
            end
        elseif(phase == length(filterfamily))
            if(~canproceed)
                    canproceed=true;
                    theend=i;
            end
            

        else
            filter1=filterfamily{phase};
            filter2=filterfamily{phase + 1};

            pfilter1=filter1(:,:,2);
            pfilter2=filter2(:,:,2);
            
            nfilter1=filter1(:,:,3);
            nfilter2=filter2(:,:,3);

            [af1,bf1]=size(pfilter1);
            [af2,bf2]=size(pfilter2);
            if(i+max(af1,af2)-1 <= a)
                window1=example(i:i-1 + af1,:);
                window2=example(i:i-1 + af2,:);

                val1=(sum(sum(pfilter1.*window1))-sum(sum(nfilter1.*window1)));
                val2=(sum(sum(pfilter2.*window2))-sum(sum(nfilter2.*window2)));
                
                if(sum(sum(window1))==0)
                    val1=0;
                    
                end
                if(sum(sum(window2))==0)
                    val2=0;
                    
                end
                
                avgpp = avgpp+val1;
              
                if val2 > Vthresh(phase + 1)             
                    canproceed=false;
                    phase=phase+1;
                    
                    avgpp = avgpp+val2-val1;
                end
            end
        end
        
    end
    phase
    if(phase ~= length(filterfamily))
        len=0;
        avgpp=0;
    else
        len = theend-start;
        avgpp=avgpp/len;
    end
end

