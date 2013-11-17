__author__ = 'Tribhuvanesh'

import os

import numpy as np

from sklearn.ensemble import RandomForestClassifier
from sklearn.cross_validation import KFold


def get_cost(predicted_y, true_y):
    assert len(predicted_y) == len(true_y)
    score = 0
    for i in range(len(true_y)):
        if true_y[i] == 1 and predicted_y[i] == -1:
            score += 1
        elif true_y[i] == -1 and predicted_y[i] == 1:
            score += 5
    return float(score) / len(true_y)


def main():
    f = open(os.path.join('data', 'training.csv'))
    data = np.loadtxt(f, delimiter=',')
    X = data[:, :-1]
    y = data[:, -1]

    kf = KFold(len(y), n_folds=10, indices=False)

    cv_scores = []

    for train, test in kf:
        X_train, X_test, y_train, y_test = X[train], X[test], y[train], y[test]

        clf = RandomForestClassifier(n_estimators=100)

        sample_weight = np.copy(y_train)
        for i in range(len(sample_weight)):
            if sample_weight[i] == -1:
                sample_weight[i] = 3

        clf.fit(X_train, y_train, sample_weight=sample_weight)
        y_test_prediction = clf.predict(X_test)
        cv_score = get_cost(y_test_prediction, y_test)
        print cv_score

        cv_scores.append(cv_score)

    print 'Average cross validation error = ', sum(cv_scores)/len(cv_scores)


if __name__ == '__main__':
    main()