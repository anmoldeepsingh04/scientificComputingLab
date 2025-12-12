% Explicit method of heun

% function y = heun(y0, dt, t_end, f)
%     step_num = floor(t_end/dt);
%     y = zeros(1, step_num+1);
%     y(1) = y0;
% 
%     for n = 1:step_num
%         y1 = f(y(n));
%         y2 = f(y(n) + dt*y1);
%         y(n+1) = y(n) + dt*(y1+y2)/2;
%     end
% end


% vector_huen
function y = heun(y0, dt, t_end, f)
    step_num = floor(t_end/dt);
    y = zeros(length(y0), step_num+1);
    y(:, 1) = y0;

    for n = 1:step_num
        y1 = f(y(:, n));
        y2 = f(y(:, n) + dt*y1);
        y(:, n+1) = y(:, n) + dt*(y1+y2)/2;
    end
end