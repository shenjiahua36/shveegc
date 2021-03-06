function d = cosine(a,b,df)
% COSINE - computes cosine distance matrix
%
% E = cosine(A,B)
%
%    A - (DxM) matrix 
%    B - (DxN) matrix
%    df = 1, force diagonals to be zero; 0 (default), do not force
% 
% Returns:
%    D - (MxN) Cosine distances between vectors in A and B
%
%
% Description : 
%    This fully vectorized (VERY FAST!) m-file computes the 
%    cosine distance between two vectors by:
%
%                 ||A-B|| = (1 - A.B/|| A |||| B||)
%
% Example : 
%    A = rand(400,100); B = rand(400,200);
%    d = distance(A,B);
%
% Author: vikas Sindhwani
% June 2004


if (nargin < 2)
   error('Not enough input arguments');
end

if (nargin < 3)
   df = 1;    % by default, force 0 on the diagonal
end

if (size(a,1) ~= size(b,1))
   error('A and B should be of same dimensionality');
end

if ~(isreal(a) && isreal(b))
   disp('Warning: running distance.m with imaginary numbers.  Results may be off.'); 
end

if (size(a,1) == 1)
  a = [a; zeros(1,size(a,2))]; 
  b = [b; zeros(1,size(b,2))]; 
end

aa=sum(a.*a); bb=sum(b.*b); ab=a'*b;
aa(aa == 0) = eps;
bb(bb == 0) = eps;
%d = sqrt(repmat(aa',[1 size(bb,2)]) + repmat(bb,[size(aa,2) 1]) - 2*ab);

d=ones(size(a,2),size(b,2))-(1./sqrt(kron(aa',bb))).*ab;

% make sure result is all real
d = real(d);

d(d < 0) = 0;

% force 0 on the diagonal? 
if (df==1)
  d = d.*(1-eye(size(d)));
end
