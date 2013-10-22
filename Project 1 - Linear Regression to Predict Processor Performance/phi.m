function [ X ] = phi( X )
%PHI Summary of this function goes here
%   Detailed explanation goes here
    % X(:, 8:9) = sqrt(X(:, 8:9));
    % X(:, 11:13) = sqrt(X(:, 11:13));
    X = [log2(X) sqrt(X) X X.^2 X.^3 X.^4];

end

