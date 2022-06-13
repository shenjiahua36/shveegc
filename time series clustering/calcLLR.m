function [ L ] = calcLLR(X, NN, DISTFUNC, KernelType, KernelParam, lambda)
%CALCLLR Compute the local learning regularization matrix
% Local learning regularization only depends upon kernel selection and
% neighborhood size.
%
% Input:
%
%             X:  a d x N data matrix
%            NN:  number of nearest neighbor
%      DISTFUNC:  'euclidean' or 'cosine', a function mapping a (d x M) 
%                 and a (d x N) matrix to an M x N distance matrix 
%                 (d: dimensionality)
%    KernelType:  'linear' | 'poly' | 'rbf' | 'cosine'
%   KernelParam:     --    | degree | sigma |    --
%        lambda:  regularization parameter
%
% Output:
%
%   L: local learning regularization matrix
%
% Author: Mingjie Qian
% Date: Dec. 31st, 2012
% -------------------------------------------------------------------- %

TYPE = 'nn';
PARAM = NN;
DATA = X';
A = adjacency_directed(DATA, TYPE, PARAM, DISTFUNC);
K = calckernel(KernelType, KernelParam, X');

NSample = size(X, 2);
n_i = NN;
I_i = eye(n_i);
% I = eye(NSample);
I = sparse(eye(NSample));
G = A;
% G = full(A);
for i = 1:NSample
    neighborhood_i = find(A(i, :));
%     fprintf('Neighborhood size of %d-th sample: %d\n', i, length(neighborhood_i));
    K_i = K(neighborhood_i, neighborhood_i);
    Neighborhood_X_i = X(:, neighborhood_i);
    x_i = X(:, i);
    k_i = calckernel(KernelType, KernelParam, x_i', Neighborhood_X_i');
    alpha_i = (K_i + n_i * lambda * I_i) \ k_i;
    G(i, neighborhood_i) = alpha_i';
end
L = (G - I)' * (G - I);

% fprintf('Mission complete.\n');

end

