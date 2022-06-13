function A = adjacency_directed(DATA, TYPE, PARAM, DISTANCEFUNCTION)

% Compute the directed adjacency graph of the data set DATA
%
% A = adjacency(DATA, TYPE, PARAM, DISTANCEFUNCTION);
%
% DATA - Nxd matrix. Data points are rows.
% TYPE - string 'nn' or string 'epsballs'.
% PARAM - integer if TYPE='nn', real number if TYPE='epsballs'.
% DISTANCEFUNCTION - function mapping a (DxM) and a (D x N) matrix
%                    to an M x N distance matrix (D:dimensionality)
% Returns: A, sparse N x N matrix of distances between the
% adjacent points, not necessarily symmetric.
%
% Example:
%
% A = adjacency(X,'nn',6)
%   A contains the adjacency matrix for the data
%   set X. For each point, the distances to 6 adjacent points are
%   stored. N
%
% Note: the adjacency relation is not symmetrized, i.e. if
% point a is adjacent to point b, then point b is not necessarily
% adjacent to point a.
%
% Author:
%
% Mikhail Belkin
% misha@math.uchicago.edu
%
% Modified by: Vikas Sindhwani
% June 2004
%
% Modified by: Mingjie Qian
% Dec. 31st, 2012
% -----------------------------------------------------------------%

% disp('Computing Directed Adjacency Graph');

if (nargin < 3) || (strcmp(TYPE,'nn') && strcmp(TYPE,'epsballs')) || ~isreal(PARAM)
    fprintf('ERROR: Too few arguments given or incorrect arguments.\n');
    fprintf('USAGE:\n A = laplacian(DATA, TYPE, PARAM)');
    fprintf('DATA - the data matrix. Data points are rows.');
    fprintf('Nearest neigbors: TYPE =''nn''    PARAM = number of nearest neigbors');
    fprintf('Epsilon balls: TYPE =''epsballs''    PARAM = redius of the ball\n');
    return;
end

n = size(DATA,1);
%disp (sprintf ('DATA: %d points in %d dimensional space.',n,size (DATA,2)));

switch TYPE
    case {'nn'}
        % disp(sprintf('Creating the adjacency matrix. Nearest neighbors, N=%d.', PARAM));
    case{'eps', 'epsballs'}
        %disp(sprintf('Creating the adjacency matrix. Epsilon balls, eps=%f.', PARAM));
end

A = sparse(n,n);
step = 100;

if (strcmp(TYPE,'nn'))
    for i1=1:step:n
        i2 = i1+step-1;
        if (i2> n)
            i2=n;
        end
        XX= DATA(i1:i2,:);
        dt = feval(DISTANCEFUNCTION, XX',DATA');
        [Z,I] = sort ( dt,2);
      
        for i=i1:i2
%             if (i == 195)
%                 a = 1;
%                 a = a + 1;
%             end
            if ( mod(i, 500) ==0)
                %disp(sprintf('%d points processed.', i));
            end
            for j=2:PARAM+1
                A(i,I(i-i1+1,j))= Z(i-i1+1,j) + eps;
                % A(I(i-i1+1,j),i)= Z(i-i1+1,j);
            end
        end
        
    end
    
    % epsilon balls
else
    for i1=1:step:n
        i2 = i1+step-1;
        if (i2> n)
            i2=n;
        end 
        
        XX= DATA(i1:i2,:);
        dt = feval(DISTANCEFUNCTION, XX',DATA');
        [Z,I] = sort ( dt,2 );
        
        for i=i1:i2
            %  if ( mod(i, 500) ==0) disp(sprintf('%d points processed.', i)); end;
            j=2;
            while ( (Z(i-i1+1,j) < PARAM))
                jj = I(i-i1+1,j);
                A(i,jj)= Z(i-i1+1,j) + eps;
                % A(jj,i)= Z(i-i1+1,j);
                j = j+1;
            end
        end
        
    end
    
end
