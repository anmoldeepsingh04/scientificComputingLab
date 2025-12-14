% equation 2

% part f: The solution is not converging for dt = 0.1
mu = 4;
u0 = 1;
v0 = 1;
init = [u0; v0];
dt = 0.01; % converges for 0.01
t_end = 20;
time = 0:dt:t_end;

f = @(y) [y(2); 
            mu*(1-y(1)^2)*y(2) - y(1)];
df = @(y) [0, 1; 
    -2*mu*y(1)*y(2)-1, mu*(1-y(1)^2)];


sol_exp = exp_euler(init, dt, t_end, f);
figure;
hold on;
plot(time, sol_exp(1, :), DisplayName='u(t)');
plot(time, sol_exp(2, :), DisplayName='v(t)');
xlabel('t');
ylabel('y(t)');
legend show;

disp(size(sol_exp))

sol_imp = imp_euler(init, dt, t_end, f, df);

figure;
hold on;

subplot(3, 1, 1);
plot(time, sol_imp(1, :), DisplayName='u(t)');
xlabel('t');
ylabel('u(t)');
legend show;

subplot(3, 1, 2);
plot(time, sol_imp(2, :), DisplayName='v(t)');
xlabel('t');
ylabel('v(t)');
legend show;

subplot(3, 1, 3);
plot(sol_imp(1, :), sol_imp(2, :), DisplayName='Phase Plot');
xlabel('u(t)');
ylabel('v(t)');
legend show;


