function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0.01;
sigma = 0.01;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
cost = 10000;
tempC = 0.01;
tempSigma = 0.01;
while (tempC < 30)
    while (tempSigma < 30)
        model = svmTrain(X, y, tempC, @(x1, x2)gaussianKernel(x1, x2, tempSigma));
        predictions = svmPredict(model, Xval);
        tempCost = mean(double(predictions ~= yval));
        disp ("Cost %f ,sigma %f ,C %f");
        disp([tempCost, tempSigma, tempC]);
        
        if (cost > tempCost)
            cost = tempCost;
            C = tempC;
            sigma = tempSigma;
        end 
        tempSigma = tempSigma*3;
    end 
    tempSigma = 0.01;
    tempC = tempC*3;
end

 disp ("Final Cost %f ,sigma %f,C %f");
 disp ([cost,sigma,C]);    
% =========================================================================

end
