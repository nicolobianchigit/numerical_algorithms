%% LU Factorization Pseudocode
% Function: LU Factorization
%
% This code was authored by Riccardo S.
% This pseudocode performs LU Factorization, decomposing the input matrix A into
% a lower triangular matrix L and an upper triangular matrix U such that A = LU.
% The matrix L stores the elimination factors below the diagonal, while U stores 
% the upper triangular part. 
% 
% Note that this function does not solve the system Ax = b;
% further steps involving forward and backward substitution are required to obtain the solution.
% No pivoting is included.
%
% Inputs:
% - A: Coefficient matrix (n x n)
%
% Outputs:
% - L: Lower triangular matrix (n x n)
% - U: Upper triangular matrix (n x n)

%%

function [L, U] = LU(A)
    
    n = size(A, 1);  % Size of the matrix
    L = eye(n);      % Initialize L as the identity matrix
    

    % LU Factorization (without pivoting)
    for j = 1:n-1
       
        for i = j+1:n
            % Calculate the elimination factor and store it in L
            L(i,j) = A(i,j) / A(j,j);
            
            % Update row i of matrix A
            A(i,j:n) = A(i,j:n) - L(i,j) * A(j,j:n);
        end
    end

    % Copy updated matrix A in U
    U = A;

    % Display the lower triangular matrix L
    disp('The lower triangular matrix L is:');
    disp(L);

    % Display the upper triangular matrix U
    disp('The upper triangular matrix U is:');
    disp(U);
   
end
