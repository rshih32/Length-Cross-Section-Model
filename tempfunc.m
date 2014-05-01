function [output] = tempfunc(example, real,wrong)
    output=example;
    output(:,:,2)=real(:,:,2);
    output(:,:,3)=wrong(:,:,2);


end

