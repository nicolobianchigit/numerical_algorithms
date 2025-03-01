function [x, res, its] = GaussSeidel(A, b, tol, maxit, x0)
    % Initialize
    n = length(b);
    x = x0;
    M = tril(A);
    N = A - M;
    r0 = b - A * x;
    res = zeros(maxit, 1);
    res(1) = norm(r0);
    
    for its = 1:maxit
        % Update x for Gauss-Seidel
        x = M \ (b - N * x);
        
        % Compute residual
        r = b - A * x;
        res(its) = norm(r) / res(1);
        
        % Check convergence
        if res(its) < tol
            res = res(1:its);
            return;
        end
    end
end
