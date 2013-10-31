% Load training CSV file
M = csvread('data/training.csv');

%%
% Constants/Parameters
NUM_ITERATIONS = 100;
ETA_T = 0.09; % Learning rate
LAMBDA = 10e-04; % Regularization parameter
K = 10; % for K-fold cross validation

RUN_VALIDATION = false;
VALIDATION_INPUT_FILE = 'data/validation.csv';
VALIDATION_OUTPUT_FILE = 'validation_output.csv';

%%
% TRAINING

% Create Matrix X for data and Vector y for labels
X_raw = M(:, 1:14);
y = M(:, 15);

% Feature transformations
X = phi(X_raw);

cvo = cvpartition(size(M,1), 'kfold', K);

k_training_error = zeros(K, 1);
k_testing_error = zeros(K, 1);
k_testing_error_cf = zeros(K, 1);

% w_avgs = zeros(K, size(X, 2) + 1);
% w_avgs_cf = zeros(K, size(X, 2) + 1);
w_avgs = zeros(K, size(X, 2) + 1);
w_avgs_cf = zeros(K, size(X, 2));

for i=1:K,
    
    train_idx_nums = find( training(cvo, i) );
    test_idx_nums = find( test(cvo, i) );
    
    X_train = X(train_idx_nums, :);
    Y_train = y(train_idx_nums, :);
    
    % Some more feature transformations to the training set
    Y_train = phiy(Y_train);
    
    X_test = X(test_idx_nums, :);
    Y_test = y(test_idx_nums, :);
        
    % Number of observations in the training data set
    m_train = size(X_train, 1);
    
%     % Feature scaling
%     X_mean = mean(X_train);
%     X_fscaled = X_train - repmat(X_mean, m_train, 1);
%     % Mean Normalization
%     X_var = var(X_train);
%     X_renorm = X_fscaled ./ repmat(sqrt(X_var),  m_train, 1);
% 
%     % Add a columns of ones to X for intercept/bias
%     % X_train_renorm = [ones(size(X_renorm,1), 1) X_renorm];
%     X_train_renorm  = X_renorm;
% 
%     % Linear Regression, returns a set of weights
%     w = rand(size(X_train_renorm, 2), 1); % Column vector
%     hold on;
% 
%     % fprintf('Initial Training Error:');
%     % disp(training_error(X_train_renorm, Y_train, w, LAMBDA) );
% 
%     for j = 1:NUM_ITERATIONS,
%         err = training_error(X_train_renorm, Y_train, w, LAMBDA);
%         plot(j, err);
%         w_0_new = w(1) - (ETA_T/m_train) * gradient_rhat(X_train_renorm(:, 1), Y_train, w(1));
%         w_rest_new = w(2:end) * (1 - ((ETA_T * LAMBDA)/m_train)) - (ETA_T/m_train) * gradient_rhat(X_train_renorm(:, 2:end), Y_train, w(2:end));
%         w = [w_0_new; w_rest_new];
%     end;
% 
%     k_training_error(i) = training_error(X_train_renorm, Y_train, w, LAMBDA) / mean(Y_train);
%     w_avgs(i, :) = w';

    w = ridge(Y_train, X_train, LAMBDA, 0);
    disp(size(w));
    % k_training_error(i) = training_error(X_train, Y_train, w, LAMBDA) / mean(Y_train);
    w_avgs(i, :) = w';
    
%     % Perform validation on cross validation test set
%     % Normalize test set
      m_test = size(X_test, 1);
%     X_fscaled_test = X_test - repmat(X_mean, m_test, 1);
%     X_test_renorm = X_fscaled_test ./ repmat(sqrt(X_var),  m_test, 1);
%     % X_test_fixed = [ones(m_test, 1) X_test_renorm];
%     X_test_fixed = X_test_renorm;

    X_test_fixed = [ones(m_test, 1) X_test];
    
    % Predict and cross-validate
    Y_pred = phiyinv(X_test_fixed * w);
    cv_error = sqrt( (1/m_test) * sum((Y_pred - Y_test).^2) ) / mean(Y_test);
    % fprintf('Testing Error %d: ', i);
    % disp(cv_error);
    k_testing_error(i) = cv_error;
    
%     % Attempt Closed form solution
%     lambda_mat = diag(ones(size(X_train_renorm, 2), 1));
%     lambda_mat(1, 1) = 0;
%     w_cf = pinv((X_train_renorm' * X_train_renorm) + lambda_mat) * X_train_renorm' * Y_train;
%     w_avgs_cf(i, :) = w_cf;
%     
%     Y_pred_cf = phiyinv(X_test_fixed * w_cf);
%     cv_error_cf = sqrt( (1/m_test) * sum((Y_pred_cf - Y_test).^2) ) / mean(Y_test);
%     k_testing_error_cf(i) = cv_error_cf;
end;

%disp('Training Errors: ');
%disp(k_training_error);
disp('Testing Errors: ');
disp(k_testing_error);
% disp('CF Testing Errors: ');
% disp(k_testing_error_cf);
% fprintf('Average training error: %f\n', mean(k_training_error));
fprintf('Average test error: %f\n', mean(k_testing_error));
% fprintf('Average CF test error: %f\n', mean(k_testing_error_cf));
% disp([mod((0:size(w,1)-1), 14)' mean(w_avgs)' mean(w_avgs_cf)']);

%%
% VALIDATION
% Predict answers for validation data set and write to a file
if RUN_VALIDATION
    X_validation_raw = csvread(VALIDATION_INPUT_FILE);

    % Transform raw dataset
    X_validation_raw = phi(X_validation_raw);
    % Feature scale and Mean normalize test set
    m_validation = size(X_validation_raw, 1);
    X_fscaled_validation = X_validation_raw - repmat(X_mean, m_validation, 1);
    X_validation_renorm = X_fscaled_validation ./ repmat(sqrt(X_var),  m_validation, 1);
    % X_validation_fixed = [ones(m_validation, 1) X_validation_renorm];
    X_validation_fixed = X_validation_renorm;
    
    % Predict
    Y_validation_predictions = phiyinv(X_validation_fixed * w_cf);

    dlmwrite(VALIDATION_OUTPUT_FILE, Y_validation_predictions);
end;  

%%