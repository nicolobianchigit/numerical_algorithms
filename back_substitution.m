function x = back_substitution(U, b)
    % Get the number of rows
    n = size(U, 1);
    % Initialize the solution vector
    x = zeros(n, 1);
    
    % Perform back substitution
    for i = n:-1:1
        % Start with the value of b(i)
        x(i) = b(i);
        
        % Subtract the known values from the right-hand side
        for j = i+1:n
            x(i) = x(i) - U(i, j) * x(j);
        end
        
        % Divide by the coefficient of the variable we just solved for
        x(i) = x(i) / U(i, i);
    end
end