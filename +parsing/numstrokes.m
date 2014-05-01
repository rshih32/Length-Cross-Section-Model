function [num] = numstrokes(examples)
%NUMSTROKES Summary of this function goes here
%   Detailed explanation goes here
    num=0;
    for i =1:length(examples)
        example = examples{i};
        num = num + length(example);
    end

end

