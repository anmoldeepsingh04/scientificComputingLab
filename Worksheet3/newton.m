% NR method to solve non-linear equations

function y = newton(x0, G, dG)
    max_iter = 100;
    tolerance = 1e-8;
    y = zeros(length(x0), max_iter);
    y(:, 1) = x0;
    n = 1;
    while norm(G(y(:, n))) > tolerance
        
        % max iter check
        if n > max_iter
            disp("Maximum number of iterations reached. Not converging.")
            break
        end
        
        % update step
        y(:, n+1) = y(:, n) - dG(y(:, n))\G(y(:, n));
        
        % counter update
        n = n + 1;
    end
    
    % trimming for only solutions
    y = y(:, 1:n);

end