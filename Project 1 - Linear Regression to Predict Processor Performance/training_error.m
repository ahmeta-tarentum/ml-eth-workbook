function [ cost ] = training_error( X, y, w, lambda )
%TRAINING_ERROR Summary of this function goes here
%   Detailed explanation goes here
    m = size(X, 1); % Number of rows
    cost = (1/2*m) * ( sum((X*w - y).^2) + (lambda*sum(w.^2)) );
end

