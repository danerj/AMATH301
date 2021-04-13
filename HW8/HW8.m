clear all
close all
clc

%%%%% Problem 1 %%%%%

% Model : xdot = rx

r = 0.5;
x0 = 4;
dt = 0.25;
t = 0:dt:5;

% Backward Euler : for dy/dt = f(t,y), y_k+1 = y_k + h*f(t_k+1,y_k+1)

%(a)

x_be = zeros(1,length(t));
x_be(1) = x0;
f = @(x) r*x;

for k = 1:length(x_be)-1
    
    x_solve = x_be(k)/(1-dt*r);
    %x_solve = fzero(@(xs) xs - x_be(k) - dt*f(xs), x_be(k));
    x_be(k+1) = x_solve;
    
end

x_exact = 4*exp(r*t);
plot(t,x_be,'go',t,x_exact,'ro')
globalerror = abs(x_be(end) - x_exact(end));
A1 = globalerror

% (b)

dt = 5;
t = 0:dt:100;

for k = 1:length(x_be)-1
    
    x_solve = x_be(k)/(1-dt*r);
    %x_solve = fzero(@(xs) xs - x_be(k) - dt*f(xs), x_be(k));
    x_be(k+1) = x_solve;
    
end

A2 = x_be(end)

%%%%% Problem 2 %%%%%%

% (a) Logist Model : 
% xdot = r(1-x/K)x
% exact solution x(t) = x0*K / (x0 + (K-x0)e^(-rt))

r = 0.5;
K = 100;
x0 = 4;

dt = 0.1;
t = 0:dt:20;
f = @(t,x) r*(1-x/K)*x;

x_fe = zeros(1,length(t));
x_fe(1) = x0;

for k = 1:length(x_fe)-1
    
    x_fe(k+1) = x_fe(k) + dt*f(t(k),x_fe(k));
    
end

x_exact = x0*K ./ (x0 + (K-x0)*exp(-r*t));
%plot(t,x_fe,'bo',t,x_exact,'go')

A3 = abs(x_fe(end) - x_exact(end))


% (b) Same problem with smaller step size

dt = 0.01;
t = 0:dt:20;
x_fe = zeros(1,length(t));
x_fe(1) = x0;

for k = 1:length(x_fe)-1
    
    x_fe(k+1) = x_fe(k) + dt*f(t(k),x_fe(k));
    
end

x_exact = x0*K ./ (x0 + (K-x0)*exp(-r*t));

%plot(t,x_fe,'bo',t,x_exact,'go')
A4 = A3 / abs(x_fe(end) - x_exact(end))

%%%%% Problem 3 %%%%%

% Lotka-Volterra Model with:

% xdot = x(3 ? x) ? 2xy
% ydot = y(2 ? y) ? xy

% (a)

x0 = 1.5;
y0 = 1;

F=@(t,v) [v(1)*(3-v(1)) - 2*v(1)*v(2); v(2)*(2-v(2)) - v(1)*v(2)];

[tout,vout] = ode45(F,[0 10],[x0 y0]);
%plot(tout,vout)
A5 = vout(end,:)

% (b)

x0 = 1;
y0 = 1.5;

[tout,vout] = ode45(F,[0 10],[x0 y0]);
%plot(tout,vout)

A6 = vout(end,:)

%%%%% Problem 4 %%%%%

% xdot = ax ? bxy
% ydot = ?cy + dxy

% (a)

a = 4; b = 2; c = 1; d = 2; x0 = 1; y0 = 1;
F = @(t,v) [a*v(1) - b*v(1)*v(2); -c*v(2) + d*v(1)*v(2)];
[tout,vout] = ode45(F, [0 12], [x0 y0]);
%plot(tout,vout)

A7 = vout(end,:)

% (b)

a = 2; b = 1; c = 4; d = 1;
F = @(t,v) [a*v(1) - b*v(1)*v(2); -c*v(2) + d*v(1)*v(2)];
[tout,vout] = ode45(F, [0 12], [x0 y0]);

%plot(tout,vout)

A8 = vout(end,:)

%%%%% Problem 5 %%%%%

% Pdot = P(R - S)
% Rdot = R(S - P)
% Sdot = S(P - R)

% (a)

P0 = 3; R0 = 1; S0 = 2;
F = @(t,v) [v(1)*(v(2)-v(3)); v(2)*(v(3) - v(1)); v(3)*(v(1) - v(2))];
[tout,vout] = ode45(F,[0 8], [P0 R0 S0]);
%plot(tout,vout)
A9 = vout(end,:)

% (b)

P0 = 2; R0 = 2; S0 = 2;
[tout,vout] = ode45(F,[0 6], [P0 R0 S0]);
%plot(tout,vout)
A10 = vout(end,:)

save('A1.dat','A1','-ascii')
save('A2.dat','A2','-ascii')
save('A3.dat','A3','-ascii')
save('A4.dat','A4','-ascii')
save('A5.dat','A5','-ascii')
save('A6.dat','A6','-ascii')
save('A7.dat','A7','-ascii')
save('A8.dat','A8','-ascii')
save('A9.dat','A9','-ascii')
save('A10.dat','A10','-ascii')