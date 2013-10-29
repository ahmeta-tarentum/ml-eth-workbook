function [ X ] = phi( X )
%PHI Summary of this function goes here
%   Detailed explanation goes here

    % Attempt 1
    % with phiy = I
    % X(:, 8:9) = sqrt(X(:, 8:9));
    % X(:, 11:13) = sqrt(X(:, 11:13));
    
    % Attempt 2
    % with phiy = sqrt
    % CV error = 0.32
    % X = [log2(X) sqrt(X) X X.^2 X.^3 X.^4 X.^5];
    
    % Attempt 3
    % with phiy = log
    % CV error = 0.35
    % X = [log2(X) sqrt(X) X X.^2 X.^3 X.^4 X.^5];
    
    % Attempt 4
    % with phiy = log2
    % CV error = 0.35
    % X = [log2(X) sqrt(X) X X.^2 X.^3 X.^4 X.^5];
    
    % Attempt 5
    % with phiy = sqrt
    % CV error = 0.32
    X = [log2(X) X X.^2 X.^3 X.^4 X.^5];
    
    % Attempt 6
    % with phiy = sqrt
    % CV error = 0
    % X = [X X.^2 X.^3 X.^4 X.^5];

end

