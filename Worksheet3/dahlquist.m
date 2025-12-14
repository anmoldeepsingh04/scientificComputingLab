% equation 1
lambda = -7;
x0 = 1;
f = @(x) lambda*x;
f_dash = @(x) lambda;
x_exact = @(t) exp(lambda*t);
t_end = 5;
dts = [1/2, 1/4, 1/8, 1/16, 1/32];
time = 0:dts(5):t_end;

% solving and plotting explicit euler
% figure;
% hold on;
% legend;
% ylim([-1,1]);
% xlabel('t')
% ylabel('x(t)')
% plot(time, x_exact(time), DisplayName="Analytical Solution");
% for n = 1:length(dts)
%     time = 0:dts(n):t_end;
%     solution = exp_euler(x0, dts(n), t_end, f);
%     plot(time, solution, DisplayName="\delta"+n+"="+dts(n))
% end

% % newton test function
% f = @(x) x.^3 - 3;
% f_dash = @(x) 3*x^2;
% x0 = 1;
% 
% newton_solution = newton(x0, f, f_dash);
% disp(newton_solution);
% figure;
% hold on;
% plot(newton_solution, DisplayName='Root');
% plot(f(newton_solution), Color='red', DisplayName='Function Value');
% xlabel('x')
% ylabel('f(x)')
% legend;
% grid on;

% % solving and plotting implicit euler solutions
% error = zeros(1, 5);
% error_red = zeros(1, 5);
% figure;
% hold on;
% ylim([-1,1]);
% xlabel('t')
% ylabel('x(t)')
% plot(time, x_exact(time), DisplayName="Analytical Solution");
% 
% for n = 1:length(dts)
%     time = 0:dts(n):t_end;
%     solution = imp_euler(x0, dts(n), t_end, f, f_dash);
%     error(1, n) = sqrt((dts(n)/t_end)*sum((x_exact(time) - solution).^2));
%     if n == 1
%         error_red(1, n) = 0;
%     else
%         error_red(1, n) = error(1, n-1)/error(1, n);
%     end
%     plot(time, solution, DisplayName="\delta"+n+"="+dts(n))
% end
% legend show;
% 
% disp(error)
% disp(error_red)

% stability check

figure;
hold on;
ylim([-1,1]);
xlabel('t')
ylabel('x(t)')
plot(time, x_exact(time), DisplayName="Analytical Solution");
legend;
stability_exp = false(length(dts), 1);
stability_imp = false(length(dts), 1);

for n = 1:length(dts)
    time = 0:dts(n):t_end;
    solution_exp = exp_euler(x0, dts(n), t_end, f);
    solution_imp = imp_euler(x0, dts(n), t_end, f, f_dash);
    
    stability_exp(n) = all(diff(solution_exp) <= 0) & all(solution_exp >= -1);
    stability_imp(n) = all(diff(solution_imp) <= 0) & all(solution_imp >= -1);

    plot(time, solution_exp, DisplayName="Explicit \delta"+n+"="+dts(n));
    plot(time, solution_imp, DisplayName="Implicit \delta"+n+"="+dts(n));
    
end


T = table( dts(:), ...
    stability_exp, ...
    stability_imp, ...
    'VariableNames',{'dt', 'Explicit_Stable', 'Implicit_Stable'} ...
    );

disp(T)
