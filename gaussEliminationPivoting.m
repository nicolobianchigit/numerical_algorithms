function x = gaussEliminationPivoting(A, b)
    % Funzione per risolvere il sistema lineare Ax = b usando
    % l'eliminazione di Gauss con pivoting parziale

    % Input:
    % A - matrice dei coefficienti
    % b - vettore dei termini noti
    % Output:
    % x - vettore delle soluzioni
    
    % Dimensione della matrice
    [n, m] = size(A); % Otteniamo le dimensioni della matrice A
    
    % Verifica che A sia quadrata e che le dimensioni di b siano compatibili
    if n ~= m
        error('La matrice A deve essere quadrata');
    end
    if length(b) ~= n
        error('La dimensione di b deve essere compatibile con la matrice A');
    end
    
    % Concatenazione della matrice A con il vettore b per formare la matrice aumentata
    Ab = [A b];
    
    % Fase di eliminazione con pivoting parziale
    for k = 1:n-1
        % Trova il massimo in valore assoluto nella colonna k per il pivot
        [~, idx] = max(abs(Ab(k:n, k))); % Trova l'indice del massimo nella colonna k
        idx = idx + k - 1; % Converti l'indice relativo alla sotto-matrice
        
        % Scambia la riga k con la riga idx se necessario
        if idx ~= k
            temp = Ab(k, :);
            Ab(k, :) = Ab(idx, :);
            Ab(idx, :) = temp;
        end
        
        % Controlla se il pivot è nullo (o quasi nullo)
        if abs(Ab(k, k)) < eps
            error('Matrice singolare o quasi singolare durante la fase di eliminazione');
        end
        
        % Eliminazione gaussiana
        for i = k+1:n
            m = Ab(i, k) / Ab(k, k);
            Ab(i, k:n+1) = Ab(i, k:n+1) - m * Ab(k, k:n+1);
        end
    end
    
    % Fase di sostituzione all'indietro
    x = zeros(n, 1);
    x(n) = Ab(n, end) / Ab(n, n);
    
    for i = n-1:-1:1
        x(i) = (Ab(i, end) - Ab(i, i+1:n) * x(i+1:n)) / Ab(i, i);
    end
end
