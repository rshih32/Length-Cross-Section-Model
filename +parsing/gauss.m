function [y] = gauss( x,u,s )
%GAUSS Summary of this function goes here
%   Detailed explanation goes here
    y=exp(-(x-u)^2/(2*s^2));

end

