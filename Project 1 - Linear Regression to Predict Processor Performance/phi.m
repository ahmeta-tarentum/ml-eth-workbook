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
    % X = [log2(X) X X.^2 X.^3 X.^4 X.^5];
    
    % Attempt 6
    % with phiy = sqrt
    % CV error = 0
    % X = [X X.^2 X.^3 X.^4 X.^5];
    
    % CV error = 0.320166
%     to_log = X;
%     to_pow1 = X;
%     to_pow2 = X;
%     to_pow3 = X;
%     to_pow4 = X;
%     to_pow5 = X;
%     to_pow6 = X;
%     X = [log(to_log) to_pow1 to_pow2.^2 to_pow3.^3 to_pow4.^4 to_pow5.^5 to_pow6.^6];
    
    % CV error = 0.317786
%     X = [X(:, 1) X(:, 3:6) X(:, 8:10) X(:, 12:end)];
%     to_log = X;
%     to_pow1 = X;
%     to_pow2 = X;
%     to_pow3 = X;
%     to_pow4 = X;
%     to_pow5 = X;
%     to_pow6 = X;
%     X = [log(to_log) to_pow1 to_pow2.^2 to_pow3.^3 to_pow4.^4 to_pow5.^5 to_pow6.^6];

    % CV error = 0.466534
    % X = [X X.*repmat(X(:, 1), 1, size(X, 2))];
    
    % CV error = 0.458168
    % X = [X X.*repmat(X(:, 2), 1, size(X, 2))];
    
    % CV error = 0.472635
    % X = [X X.*repmat(X(:, 3), 1, size(X, 2))];
    
    % CV error = 0.459141
    % X = [X X.*repmat(X(:, 4), 1, size(X, 2))];
    
    % CV error = 0.460688
    % X = [X X.*repmat(X(:, 5), 1, size(X, 2))];
    
    % CV error = 0.455166
    % X = [X X.*repmat(X(:, 6), 1, size(X, 2))];
    
    % CV error = 0.448840
    % X = [X X.*repmat(X(:, 7), 1, size(X, 2))];
    
    % CV error = 0.467657
    % X = [X X.*repmat(X(:, 8), 1, size(X, 2))];
    
    % CV error = 0.469474
    % X = [X X.*repmat(X(:, 9), 1, size(X, 2))];
    
    % CV error = 0.451002
    % X = [X X.*repmat(X(:, 10), 1, size(X, 2))];
    
    % CV error = 0.460749
    % X = [X X.*repmat(X(:, 11), 1, size(X, 2))];
    
    % CV error = 0.444211
    % X = [X X.*repmat(X(:, 12), 1, size(X, 2))];
    
    % CV error = 0.377506
    % X = [X X.*repmat(X(:, 13), 1, size(X, 2))];
    
    % CV error = 0.414871
    % X = [X X.*repmat(X(:, 14), 1, size(X, 2))];
    
    % CV error = 0.382482
    % X = [X X.*repmat(X(:, 13), 1, size(X, 2)) X.*repmat(X(:, 14), 1, size(X, 2))];
    
    % CV error = 0.408416
    X = [X X(:, 13).^2 X(:, 11).*X(:, 13)];

end

