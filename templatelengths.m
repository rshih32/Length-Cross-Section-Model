function [ lengthtemplate, strokeidentifier ] = templatelengths( orderedlengthtemplate )
%TEMPLATELENGTHS Summary of this function goes here
%   Detailed explanation goes here
[rowdim,coldim,numrotations] = size(orderedlengthtemplate);
lengthtemplate = zeros(rowdim,coldim,numrotations);
strokeidentifier = zeros(rowdim,coldim,numrotations);
maxfuzz=2;
for rotation=1:numrotations
    for i=1:rowdim
        %mode 0 means we are looking for a section and are in open space.
        %mode 1 means we have already hit a pixel, but may look to extend 
        %the previous space.
        mode=0;
        %fuzzpixels is the amount of whitespace we will allow between
        %pixels and still consider it part of the same length measurement.
        %(we will use maxfuzz white spaces)
        fuzzpixels=0;
        lengthtemplatecol=0;
        length=0;
        
        
        for j=1:coldim
            length = length + 1;
            %if we hit a pixel
            if(orderedlengthtemplate(i,j,rotation) > 0)
                
                if(mode == 0)
                    if(lengthtemplatecol ~= 0)
                        lengthtemplate(i,lengthtemplatecol, rotation) = length;
                       
                    end
                    lengthtemplatecol = lengthtemplatecol +1;
                    strokeidentifier(i,lengthtemplatecol, rotation)=orderedlengthtemplate(i,j,rotation);
                     
                    length = 0;
                    fuzzpixels=0;
                    mode = 1;
                elseif(mode == 1)
                    fuzzpixels = 0;
                end
            else
                if(mode == 0)
                    %do nothing
                elseif(mode == 1)
                    fuzzpixels=fuzzpixels + 1;
                    if fuzzpixels >= maxfuzz
                        
%                         if(length > maxfuzz)
% %                             if(lengthtemplatecol ~= 0)
% %                                 lengthtemplate(i,lengthtemplatecol, rotation) = length;
% %                                 
% %                             end
% %                             lengthtemplatecol = lengthtemplatecol +1;
%                             length = fuzzpixels;
%                         else
%                             length = fuzzpixels;                            
%                         end  
                        length = fuzzpixels;
                        fuzzpixels=0;
                        mode=0;
                    end
                end
            end
        end
        %remove identifier if the length would not be recorded
%         if strokeidentifier(i,2, rotation) == 0
%             strokeidentifier(i,1, rotation)=0;
%         end
    end
end

end

