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
    % X = [X X(:, 13).^2 X(:, 11).*X(:, 13)];
    
    % CV error = 0.292294
    % X = [X X.*repmat(X(:, 13), 1, size(X, 2)) X.^2 X.^3 X.^4 X.^5 X.^6];
    
    % CV error = 0.255053
    % X = [log(X) X X.*repmat(X(:, 13), 1, size(X, 2)) X.^2 X.^3 X.^4 X.^5 X.^6];
        
    % CV error = 0.430720
    % X = [X(:, 3) X(:, 5) X(:, 8) X(:, 10) X(:, 13) X(:, 14)];
    
    % CV error = 0.398825
    % temp_X = [X(:, 3) X(:, 5) X(:, 8) X(:, 10) X(:, 13) X(:, 14)];
    % X = [temp_X X(:, 13).^2 X(:, 11).*X(:, 13)];
    
    % CV error = 0.324603
%     temp_X = [X(:, 3) X(:, 5) X(:, 8) X(:, 10) X(:, 13) X(:, 14)];
%     X = [log(temp_X) temp_X temp_X.^2 temp_X.^3 temp_X.^4];
    
    % CV error = 0.381539
    % temp_X = [X(:, 3) X(:, 5) X(:, 8) X(:, 10) X(:, 13) X(:, 14)];
    % X = [log(temp_X) temp_X temp_X.^2];
    
    % CV error = 0.330208
    % temp_X = [X(:, [3 5 8 10 13 14])];
    % X = [log(temp_X) temp_X temp_X.^2 X.*repmat(X(:, 13), 1, size(X, 2))];
    
    % CV error = 0.337644
%     temp_X = [X(:, [3 5 8 10 13 14])];
%     temp_x14_mult = X.*repmat(X(:, 14), 1, size(X, 2));
%     X = [log(temp_X) temp_X temp_X.^2 X.*repmat(X(:, 13), 1, size(X, 2)) temp_x14_mult(:, [1 2 4 6 7 8 9 12 13 14])];

    % CV error = 0.253399
    % temp_X = [X(:, [3 5 8 10 13 14])];
    % X = [log(temp_X) X.*repmat(X(:, 13), 1, size(X, 2)) temp_X temp_X.^2 temp_X.^3 temp_X.^4 temp_X.^5];
    
    % CV error = 0.246295
    % temp_X = [X(:, [3 5 8 10 13 14])];
    % X = [log(temp_X) sqrt(temp_X) X.*repmat(X(:, 13), 1, size(X, 2)) temp_X temp_X.^2 temp_X.^3 temp_X.^4 temp_X.^5];
    
    % CV error = 0.259518
    % temp_X = [X(:, [3 5 8 10 13 14])];
    % X = [log(temp_X) sqrt(temp_X) X.*repmat(X(:, 13), 1, size(X, 2)) temp_X temp_X.^2 temp_X.^3 temp_X.^4 temp_X.^5];
    
	% CV error = 0.258146
%     temp_X = [X(:, [3 5 8 10 13 14])];
%     X = [log(temp_X) sqrt(temp_X) sqrt(temp_X) X.*repmat(X(:, 13), 1, size(X, 2)) temp_X temp_X.^2 temp_X.^3 temp_X.^4 temp_X.^5];
    
    % CV error = 0.247860
%      temp_X = [X(:, [3 5 8 10 13 14])];
%      X = [X.*repmat(X(:, 13), 1, size(X, 2)) X.*repmat(X(:, 5), 1, size(X, 2)) temp_X log(temp_X) sqrt(temp_X) temp_X.^2 temp_X.^3 temp_X.^4 temp_X.^5] ;
    
    % CV Error = 0.349408
    % X = [X X(:, 5).^2 X(:, 5).^3 X(:, 5).*X(:, 10).^2  X(:, 5).*X(:, 10) X(:, 13).^2.*X(:, 14) X(:, 13).^3  X(:, 13).^2  X(:, 13).*X(:, 14)] ;
    
    % CV Error = 0.329196
    % temp_X = [X(:, [3 5 8 10 13 14])];
    % X = [X.*repmat(X(:, 13), 1, size(X, 2)) X.*repmat(X(:, 5), 1, size(X, 2))  temp_X log(temp_X) sqrt(temp_X)];
    
    % CV Error = 0.217533, with Lambda=10e-05
%     linear_X  = X(:,[5 10 13]);
%     square_root_X = sqrt(X(:, [5 8 10 13 14]));
%     log_X = log(X(:,[3 5 10 13 14]));
%     X_5_comb = X.*repmat(X(:, 5), 1, size(X, 2));
%     X_5_comb = X_5_comb(:,[1 2 3 5 6 7 10]);
%     X_13_comb = X.*repmat(X(:, 13), 1, size(X, 2));
%     X = [ X_5_comb X_13_comb linear_X   log_X square_root_X];
    
    % CV Error = 0.197356 with Lambda=10e-05
    linear_X  = X(:,[5 10 13]);
    square_root_X = sqrt(X(:, [5 8 10 13 14]));
    log_X = log(X(:,[3 5 10 13 14]));
    X_5_comb = X.*repmat(X(:, 5), 1, size(X, 2));
    X_5_comb = X_5_comb(:,[10]);
    X_13_comb = X.*repmat(X(:, 13), 1, size(X, 2));
    X_13_comb = X_13_comb(:,[14]);
    X_4_comb = X.*repmat(X(:, 4), 1, size(X, 2));
    X_4_comb = X_4_comb(:,[5 8 10]);
    square_X = X(:,[3 4 13]).^2;
    X = [ X_5_comb X_13_comb linear_X log_X square_root_X X_4_comb square_X];
    
end

