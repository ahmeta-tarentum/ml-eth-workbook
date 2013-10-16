% Load training CSV file
M = csvread('data/training.csv');

%%
% Constants/Parameters
NUM_ITERATIONS = 100;
ETA_T = 0.1; % Learning rate
LAMBDA = 1.0; % Regularization parameter

%%
% TRAINING

% Create Matrix X for data and Vector y for labels
X = M(:, 1:14);
y = M(:, 15);

% Feature scaling
X_mean = mean(X);
X_fscaled = X - repmat(X_mean, size(X, 1), 1);
% Mean Normalization
X_var = var(X);
X_renorm = X_fscaled ./ repmat(sqrt(X_var),  size(X, 1), 1);

% Add a columns of ones to X for intercept/bias
X_renorm = [ones(size(X_renorm,1), 1) X_renorm];

% Linear Regression, returns a set of weights
w = rand(size(X_renorm, 2), 1); % Column vector
m = size(X_renorm, 1);
hold on;

fprintf('Initial Training Error:');
disp(training_error(X_renorm, y, w, LAMBDA) );

for j = 1:NUM_ITERATIONS,
    err = training_error(X_renorm, y, w, LAMBDA);
    plot(j, err);
    w_0_new = w(1) - (ETA_T/m) * gradient_rhat(X_renorm(:, 1), y, w(1));
    w_rest_new = w(2:end) * (1 - ((ETA_T * LAMBDA)/m)) - (ETA_T/m) * gradient_rhat(X_renorm(:, 2:end), y, w(2:end));
    w = [w_0_new; w_rest_new];
end;

fprintf('Final Training Error:');
disp(training_error(X_renorm, y, w, LAMBDA) );

%%
% VALIDATION

%%