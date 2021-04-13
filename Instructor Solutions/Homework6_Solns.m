% Homework 6 Solutions
clear all; close all; clc

f = @ (x) (2-x(1)).^2+10*(x(2)-x(1).^2).^2;

A1 = f([1; 10]);
save('A1.dat','A1','-ascii')

xmin = fminsearch(f,[1; 10]);

save('A2.dat','xmin','-ascii')

f_x = @ (x) -2*(2-x(1))-40*x(1)*(x(2)-x(1)^2);
f_y = @ (x) 20*(x(2)-x(1)^2);

grad = [f_x([1; 10]); f_y([1; 10])];
save('A3.dat','grad','-ascii')

norm_grad = norm(grad,Inf);
save('A4.dat','norm_grad','-ascii')

phi = @ (t) [1;10] - t*grad;
A5 = phi(0.1);
save('A5.dat','A5','-ascii')

A6 = f(phi(0.1));
save('A6.dat','A6','-ascii')

f_phi = @ (t) f(phi(t));

tmin = fminbnd(f_phi,0,0.1);
save('A7.dat','tmin','-ascii')

A8 = phi(tmin);
save('A8.dat','A8','-ascii')

% Full method
clear all;

f = @ (x) (2-x(1)).^2+10*(x(2)-x(1).^2).^2;
f_x = @ (x) -2*(2-x(1))-40*x(1)*(x(2)-x(1)^2);
f_y = @ (x) 20*(x(2)-x(1)^2);

tolerance = 1e-4;
x = [1; 10];
max_iter = 10000;
iter = 0;

grad = [f_x(x); f_y(x)];

while norm(grad,Inf) >= tolerance && iter < max_iter
    phi = @ (t) x - t*grad;
    f_phi = @ (t) f(phi(t));
    tmin = fminbnd(f_phi,0,0.1);
    x = phi(tmin);
    grad = [f_x(x); f_y(x)];
    iter = iter+1;
end

save('A9.dat','x','-ascii')
save('A10.dat','iter','-ascii')




