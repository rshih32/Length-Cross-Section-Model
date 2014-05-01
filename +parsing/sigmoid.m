function [ y ] = sigmoid( x,x0 )
%SIGMOID Summary of this function goes here
%   Detailed explanation goes here
    y=1+exp(-(x-x0));
    y=1/y;

end

