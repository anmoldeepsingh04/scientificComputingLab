% solution for 1st question in WS2

function x = dahlquist_plot(t)
    lambda = -1;
    time_step = linspace(0, t, 100);
    x = exp(lambda*time_step);
end

% plotting x(t) for t in [0,5]
figure;
time_step = linspace(0,5, 100);
plot(time_step, dahlquist_plot(5));
xlabel('t');
ylabel('x(t)');
title('Analytical Solution of x'' = -x');
grid on;

y0 = 1;
t_end = 5;
lambda = -1;
dts = [1, 1/2, 1/4, 1/8];

methods = {@exp_euler, @heun, @rk4};
method_names = {'Explicit Euler', 'Heun', 'RK4'};
x_exact = @(t) exp(lambda*t);
dahlquist = @(x) lambda*x;
error = zeros(3, 4);
error_red = zeros(3, 4);
% using explicit euler

for n = 1:3
    figure;
    hold on;
    legend;
    xlabel('t');
    ylabel('x(t)');
    title('Solution using', method_names{n});
    grid on;

    for j = 1:4
        time = 0:dts(j):t_end;
        y = methods{n}(y0, dts(j), t_end, dahlquist);
        plot(time,y, 'DisplayName',"\deltat = " + dts(j))
        error(n,j) = sqrt((dts(j)/t_end) *sum((x_exact(time) - y).^2));
        if j == 1
            error_red(n, j) = 0;
        else
            error_red(n, j) = error(n, j-1)/error(n, j);
        end
    end   
    plot(time, x_exact(time), 'DisplayName', 'Analytical Solution')
end

disp(error_red)