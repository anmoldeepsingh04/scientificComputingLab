% solving and plotting implicit euler solutions
mu = 4;
x0 = 1;
f = @(x) lambda*x;
f_dash = @(x) lambda;
x_exact = @(t) exp(lambda*t);
t_end = 100;
dts = [1/2, 1/4, 1/8, 1/16, 1/32];
y = [0; 1];
t = 150;
time = 0:t:t_end;
% solution = imp_euler(x0, t, t_end, f, f_dash);
% error(1, n) = sqrt((dts(n)/t_end)*sum((x_exact(time) - solution).^2));
% if n == 1
%     error_red(1, n) = 0;
% else
%     error_red(1, n) = error(1, n-1)/error(1, n);
% end
% plot(time, solution, DisplayName="\delta"+n+"="+dts(n))


% disp(error)
% disp(error_red)

df = @(y) [0, 1; 
    -2*mu*y(1)*y(2)-1, mu*(1-y(1)^2)];
disp(size(df(y)))