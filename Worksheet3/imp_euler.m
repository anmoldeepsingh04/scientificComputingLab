% implicit euler

% problem y' = f(y) and y(0) = y0

function y = imp_euler(y0, dt, t_end, f, df)
    step_num = floor(t_end/dt);
    y = zeros(length(y0), step_num+1);
    y(:, 1) = y0;
    tolerance = 1e-8;

% newton(x0, G, dG)

    for n = 1:step_num
        G = @(z) z - y(:, n) - dt*f(z);
        dG = @(z) eye(length(z)) - dt*df(z);
        sol = newton(y(:, n), G, dG);
        if norm(G(sol(:, end))) > tolerance
            disp(['Newton did not converge at step ', num2str(n)]);
            y = y(:, 1:n);   % Keep only valid computed values
            break
        end
        y(:, n+1) = sol(:, end);
    end
end