%% Determinant Computation Using LU Factorization
% Function: LU_DET
%
% This code was authored by Riccardo S.
% This function computes the determinant of a square matrix A using LU factorization.
% The matrix A is first decomposed into a lower triangular matrix L and an upper triangular 
% matrix U such that A = LU. The determinant is then calculated as the product of the 
% diagonal elements of U. This approach allows for efficient computation, particularly for 
% larger matrices, by leveraging the properties of triangular matrices.
%
% Inputs:
% - A: Square matrix (n x n)
%
% Outputs:
% - det_A: Scalar value representing the determinant of matrix A.
%%


function det_A = LU_DET(A)
   

    % Step 1: Perform LU factorization
    [~, U] = LU(A);  % Call to the LU factorization function

    % Step 2: Calculate the determinant as the product of the diagonal elements of U
    det_A = prod(diag(U));  % Product of the diagonal elements

    % Display the determinant
    disp('Determinant of matrix A is:');
    disp(det_A);
end
