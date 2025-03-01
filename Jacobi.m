function [x, res, its] = Jacobi(A, b, tol, maxit, x0)
    % Jacobi Method for solving A*x = b
    %
    % Inputs:
    %   A     - coefficient matrix
    %   b     - right-hand side vector
    %   tol   - tolerance for stopping criterion
    %   maxit - maximum number of iterations
    %   x0    - initial guess for the solution
    %
    % Outputs:
    %   x     - solution vector
    %   res   - residual at each iteration
    %   its   - number of iterations performed

    % Get the size of matrix A
    n = length(b);
    
    % Initialize solution vector x
    x = x0;
    
    % Initialize residual vector
    res = zeros(maxit, 1);
    
    % Initialize diagonal matrix D and remainder matrix R
    D = diag(diag(A));
    R = A - D;
    
    % Jacobi iterative process
    for its = 1:maxit
        % Compute the next iteration of x
        x_new = D \ (b - R * x);
        
        % Compute the residual (difference between iterations)
        res(its) = norm(b - A * x_new);
        
        % Check if residual is within tolerance
        if res(its) < tol
            x = x_new;
            res = res(1:its); % trim residual vector
            return;
        end
        
        % Update solution for next iteration
        x = x_new;
    end
    
    % If maximum iterations reached, output result
    res = res(1:maxit); % trim residual vector
end
