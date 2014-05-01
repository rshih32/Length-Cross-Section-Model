function [ error ] = errmeasure( query, template )
%ERRMEASURE Summary of this function goes here
%   Detailed explanation goes here
    error = sum(abs(query-template));

end

