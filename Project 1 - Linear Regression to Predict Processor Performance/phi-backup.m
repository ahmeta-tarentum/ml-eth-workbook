function [ X ] = phi( X )
%PHI Summary of this function goes here
%   Detailed explanation goes here
    % X(:, 8:9) = sqrt(X(:, 8:9));
    % X(:, 11:13) = sqrt(X(:, 11:13));
    
    % CVE = 0.441739
    % X = [X];
    
    % CVE = 0.538759
    % X = [X .^ 2];
    
    % CVE = 0.454723
    % X = [log(X) X];
    
    % CVE = 0.425698
    % X = [X X .^ 2];
    
    % CVE = 0.395082
    % X = [log(X) X X.^2];
    
    % CVE = 0.363544
    % X = [X X.^2 X.^3 X.^4 X.^5];
    
    % CVE = 0.358126
    % X = [log(X) X X.^2 X.^3];
    
    % CVE = 0.343807
    % X = [sqrt(X) X X.^2 X.^3 X.^4 X.^5];
    
    % CVE = 0.3327
    % X = [log(X) X X.^2 X.^3 X.^4];
    
    % CVE = 0.3227
    % X = [log(X) X X.^2 X.^3 X.^4 X.^5];
        
    % CVE = 0.319021
    % X = [log(X) X X.^2 X.^3 X.^4 X.^5 X.^6];
    
    % CVE = 0.332453
    % Remove columns 2, 10, 11
    % X = [X(:, 1) X(:, 3:9) X(:, 12:end)];
    % X = [log(X) X X.^2 X.^3 X.^4 X.^5 X.^6];
    
    % CVE = 0.318533
    % Remove column 2
    % X = [X(:, 1) X(:, 3:end)];
    % X = [log(X) X X.^2 X.^3 X.^4 X.^5 X.^6];
    
    % CVE = 0.313234
    % Remove column 2, 11
    X = [X(:, 1) X(:, 3:10) X(:, 12:end)];
    X = [log(X) X X.^2 X.^3 X.^4 X.^5 X.^6];
    
     % CVE = 0.321549
%     to_log = [X(:, 1:6) X(:, 9) X(:, 11:end)]; % Remove 7, 8, 10
%     to_pow1 = [X(:, 1:7) X(:, 9:10) X(:, 12:end)]; % Remove 8, 11
%     to_pow2 = [X(:, 1:6) X(:, 8) X(:, 10:end)]; % Remove 7, 9
%     to_pow3 = [X(:, 1:5) X(:, 7:8) X(:, 10:end)]; % Remove 6, 9
%     to_pow4 = [X(:, 2:3) X(:, 5:8) X(:, 13:end)]; % Remove 1, 4, 9, 10, 11, 12
%     to_pow5 = [X(:, 1) X(:, 3:5) X(:, 8:end)]; % Remove 2, 6, 7
%     to_pow6 = [X(:, 1:6) X(:, 8:end)]; % Remove 7
%     X = [log(to_log) to_pow1 to_pow2.^2 to_pow3.^3 to_pow4.^4 to_pow5.^5 to_pow6.^6];

    % CVE = 0.
%     to_log = [X(:, 1:6) X(:, 9) X(:, 11:end)]; % Remove 7, 8, 10 - 0.315156
%     to_pow1 = [X(:, 1:7) X(:, :) X(:, 9:10) X(:, 12:end)]; % Remove 8, 11 - 0.316616
%     to_pow2 = [X(:, 1:6) X(:, 8) X(:, 10:end)]; % Remove 7, 9 - 0.316174
%     to_pow3 = X; % [X(:, 1:5) X(:, 7:8) X(:, 10:end)]; % Remove 6, 9 - 0.318493
%     to_pow4 = [X(:, 2:3) X(:, 5:8) X(:, 13:end)]; % Remove 1, 4, 9, 10, 11, 12 - 0.317786
%     to_pow5 = [X(:, 1) X(:, 3:5) X(:, 8:end)]; % Remove 2, 6, 7 - 0.316825
%     to_pow6 = X; % [X(:, 1:6) X(:, 8:end)]; % Remove 7 - 0.317626
%     X = [log(to_log) to_pow1 to_pow2.^2 to_pow3.^3 to_pow4.^4 to_pow5.^5 to_pow6.^6];
    
    
    
end

