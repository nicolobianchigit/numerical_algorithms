function A_inv = matrix_inverse_using_LU(A)
    % This function returns the inverse of matrix A using LU factorization
    
    % Perform LU decomposition of matrix A
    [L, U, P] = lu(A);
    
    % Get the size of matrix A
    n = size(A, 1);
    
    % Initialize the inverse matrix A_inv as an empty matrix
    A_inv = zeros(n);
    
    % Identity matrix of the same size as A
    I = eye(n);
    
    % Solve L * Y = P * I (forward substitution)
    for i = 1:n
        % Solve for each column of the inverse
        Y = L \ (P * I(:, i));
        
        % Solve U * X = Y (backward substitution)
        A_inv(:, i) = U \ Y;
    end
end
