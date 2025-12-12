% rk4
function y = rk4(y0, dt, t_end, f)
    step_num = floor(t_end/dt);
    y = zeros(1, step_num+1);
    y(1) = y0;

    for n = 1:step_num
        y1 = f(y(n));
        y2 = f(y(n) + dt*y1/2);
        y3 = f(y(n) + dt*y2/2);
        y4 = f(y(n) + dt*y3);
        y(n+1) = y(n) + dt*(y1 + 2*y2 + 2*y3 + y4)/6;
    end
end