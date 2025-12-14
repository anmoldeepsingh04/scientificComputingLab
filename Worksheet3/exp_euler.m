% explicit euler method
function y = exp_euler(y0, dt, t_end, f)
    step_num = floor(t_end/dt);
    y = zeros(length(y0), step_num+1);
    y(:, 1) = y0;
    for n = 1:step_num
        y(:, n+1) = y(:, n) + dt*f(y(:, n));
    end
end