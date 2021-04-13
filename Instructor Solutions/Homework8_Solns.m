% Homework 8 Solutions
clear all; close all; clc

% Problem 1(a)
r = 0.5;
x0 = 4;

T = 5;
dt = 0.25;
t = 0:dt:T;

N = length(t);
x = zeros(1,N);
x(1) = x0;

for k = 1:N-1
   x(k+1) = x(k)/(1-dt*r); 
end

exact_soln = x0*exp(r*5);

error = abs(exact_soln-x(N));
save('A1.dat','error','-ascii')

% Problem 1(b)
T = 100;
dt = 5;
t = 0:dt:T;

N = length(t);
x = zeros(1,N);
x(1) = x0;

for k = 1:N-1
   x(k+1) = x(k)/(1-dt*r); 
end

A2 = x(N);
save('A2.dat','A2','-ascii')

% Problem 2(a)
r = 0.5;
K = 100;
f = @ (x) r*(1-x/K)*x;
x0 = 4;

T = 20;
dt = 0.1;
t = 0:dt:T;

N = length(t);
x = zeros(1,N);
x(1) = x0;

for k = 1:N-1
   x(k+1) = x(k)+dt*f(x(k)); 
end

exact_soln = x0*K/(x0+(K-x0)*exp(-r*20));

error1 = abs(exact_soln-x(N));
save('A3.dat','error1','-ascii')

% Problem 2(b)
dt = 0.01;
t = 0:dt:T;

N = length(t);
x = zeros(1,N);
x(1) = x0;

for k = 1:N-1
   x(k+1) = x(k)+dt*f(x(k)); 
end

exact_soln = x0*K/(x0+(K-x0)*exp(-r*20));

error2 = abs(exact_soln-x(N));
A4 = error1/error2;
save('A4.dat','A4','-ascii')

% Problem 3(a)
f = @ (t,x) [x(1)*(3-x(1)) - 2*x(1)*x(2); x(2)*(2-x(2))-x(1)*x(2)];
x0 = [1.5 1];
[t_num,x_num] = ode45(f,[0 10],x0);
A5 = x_num(end,:);
save('A5.dat','A5','-ascii')

% Problem 3(b)
x0 = [1 1.5];
[t_num,x_num] = ode45(f,[0 10],x0);
A6 = x_num(end,:);
save('A6.dat','A6','-ascii')

% Problem 4(a)
a = 4;
b = 2;
c = 1;
d = 2;
f = @ (t,x) [a*x(1)-b*x(1)*x(2); -c*x(2)+d*x(1)*x(2)];
x0 = [1 1];
[t_num,x_num] = ode45(f,[0 12],x0);

A7 = x_num(end,:);
save('A7.dat','A7','-ascii')

% Problem 4(b)
a = 2;
b = 1;
c = 4;
d = 1;
f = @ (t,x) [a*x(1)-b*x(1)*x(2); -c*x(2)+d*x(1)*x(2)];
x0 = [1 1];
[t_num,x_num] = ode45(f,[0 12],x0);

A8 = x_num(end,:);
save('A8.dat','A8','-ascii')

% Problem 5(a)
f = @ (t,x) [x(1)*(x(2)-x(3)); x(2)*(x(3)-x(1)); x(3)*(x(1)-x(2))];
x0 = [3 1 2];
[t_num,x_num] = ode45(f,[0 8],x0);

A9 = x_num(end,:);
save('A9.dat','A9','-ascii')


% Problem 5(b)
x0 = [2 2 2];
[t_num,x_num] = ode45(f,[0 6],x0);

A10 = x_num(end,:);
save('A10.dat','A10','-ascii')