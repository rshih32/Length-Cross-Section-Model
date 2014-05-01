function [len, avgpp] = filterconvlength( example, filterfamily )
%FILTERCONVLENGTH Summary of this function goes here
%   Detailed explanation goes here
    [a,b]=size(example);
    phase=0;
    avgpp=0;
    start=0;
    theend=0;
    canproceed=false;
    
   
    for i=1:b
        
       
        val1=0;
        val2=0;
        
        
            
        if(phase == 0)
            filter2=filterfamily{1};
            pfilter2=filter2(:,:,2);
            nfilter2=filter2(:,:,3);
            [af2,bf2]=size(pfilter2);
            
            if(i+bf2-1 <= b)
                window=example(:,i:i-1 + bf2);
                
                
                
                val2=(sum(sum(pfilter2.*window))-sum(sum(nfilter2.*window)));
    %            
%                 if(i==1)
%                     sum(sum(pfilter2))
%                     t=zeros(a,b,3);
%                     t(:,:,1) = example;
%                     t(:,i:i-1 + bf2,2) = pfilter2;
%                     t(:,i:i-1 + bf2,3) = nfilter2;
%                     image(t)
%                     val2
%                 end
                if(sum(sum(window))==0)
                    val2=0;
                end
    
                if val2 > 35
                    start=i;
                    phase=1;
                    
                    
%                     t=zeros(a,b,3);
%                     t(:,:,1) = example;
%                     t(:,i:i-1 + bf2,2) = pfilter2;
%                     t(:,i:i-1 + bf2,3) = nfilter2;
%                     image(t)
%                     val2
%                    saveas(gcf,strcat('ANDXOR' ,int2str(phase)),'jpg');
                end
                avgpp = avgpp+val2;
            end
        elseif(phase == length(filterfamily))

            filter1=filterfamily{phase};
            pfilter1=filter1(:,:,2);
            nfilter1=filter1(:,:,3);
            [af1,bf1]=size(pfilter1);
            if(i+bf1-1 <= b)
                window=example(:,i:i-1 + bf1);
                val1=(sum(sum(pfilter1.*window))-sum(sum(nfilter1.*window)));
                if(sum(sum(window))==0)
                    val1=0;
                end
                avgpp = avgpp+val1;
                
                if val1 <= 0 && ~canproceed
                    canproceed=true;
                    theend=i;
                end
                if(canproceed)
                    avgpp = avgpp-val1;
                end
            else
                
                if(~canproceed)
                    canproceed=true;
                    theend=i;
                end
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
            if(i+max(bf1,bf2)-1 <= b)
                window1=example(:,i:i-1 + bf1);
                window2=example(:,i:i-1 + bf2);

                val1=(sum(sum(pfilter1.*window1))-sum(sum(nfilter1.*window1)));
                val2=(sum(sum(pfilter2.*window2))-sum(sum(nfilter2.*window2)));
                
                if(sum(sum(window1))==0)
                    val1=0;
                    
                end
                if(sum(sum(window2))==0)
                    val2=0;
                    
                end
                
                avgpp = avgpp+val1;
                
                if val2 > 35
                    
                    if(~canproceed)
%                     val2
%                     t=zeros(a,b,3);
%                     t(:,:,1) = example;
%                     t(:,i:i-1 + bf2,2) = pfilter2;
%                     t(:,i:i-1 + bf2,3) = nfilter2;
%                     figure;
%                     image(t)
%                      saveas(gcf,strcat('ANDXOR', int2str(phase+1)),'jpg');
                    end
                    canproceed=true;
                   
                end
                
                    
              
                if canproceed && val2>val1
%                     i
%                     val1
%                     val2
                   % if(i==65)
%                         t=zeros(a,b,3);
%                         t(:,:,1) = example;
%                         t(:,i:i-1 + bf1,2) = pfilter1;
%                         t(:,i:i-1 + bf1,3) = nfilter1;
%                         figure;
%                         image(t)
%                         
%                         t=zeros(a,b,3);
%                         t(:,:,1) = example;
%                         t(:,i:i-1 + bf2,2) = pfilter2;
%                         t(:,i:i-1 + bf2,3) = nfilter2;
%                         figure;
%                         image(t)
                      
                        
                   % end
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

