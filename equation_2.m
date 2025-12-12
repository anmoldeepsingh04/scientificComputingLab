% equation 2: Solving the Van der Pol systwm
x0 = 1;
y0 = 1;
mu = 1;
init = [x0, y0];
dt = 0.1;
t_end = 20;
f = @(x)[x(2); mu*(1-x(1)^2)*x(2) - x(1)];
sol = vector_heun(init, dt, t_end, f);
time = 0:dt:t_end;
disp(sol)

subplot(3,1,1)
plot(time, sol(1,:))

subplot(3,1,2)
plot(time, sol(2,:))

subplot(3,1,3)
plot(sol(2,:), sol(1,:))

figure
[x, y] = meshgrid(0:0.8:10, 0:0.8:10);
u = y;
v = mu*(1-x.^2).*y - x;

quiver(x, y, u, v, 1.5);
xlabel('x'); 
ylabel('y');
title('Phase Space Vector Field (Van der Pol)');
axis equal;
grid on;

% revision