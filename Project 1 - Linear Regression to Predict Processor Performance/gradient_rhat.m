function [ gradient ] = gradient_rhat( X, y, w )
%R_HAT Summary of this function goes here
%   Detailed explanation goes here
    inner = X*w - y;
    gradient = (inner' * X)';
end

