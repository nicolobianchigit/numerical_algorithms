function x = gaussian_elimination(A, b)
    % Ensure b is a column vector
    if size(b, 2) > 1
        error('b must be a column vector');
    end
    
    % Get the number of rows
    n = size(A, 1);
    
    % Check if dimensions are compatible
    if size(A, 1) ~= size(b, 1)
        error('The number of rows in A must match the number of rows in b');
    end

    % Augment the matrix A with the vector b
    Ab = [A, b];  % Create augmented matrix [A | b]

    % Forward elimination
    for i = 1:n
        % Eliminate entries below the pivot
        for j = i+1:n
            factor = Ab(j, i) / Ab(i, i);  % Calculate the factor
            Ab(j, :) = Ab(j, :) - factor * Ab(i, :);  % Eliminate the entry
        end
    end
    
    % Back substitution
    x = zeros(n, 1);  % Initialize solution vector
    for i = n:-1:1
        x(i) = Ab(i, end);  % Start with the last element of the augmented matrix
        for j = i+1:n
            x(i) = x(i) - Ab(i, j) * x(j);  % Subtract the known values
        end
        % Normalize the value
        x(i) = x(i) / Ab(i, i);
    end
end
