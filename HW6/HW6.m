clear all
close all
clc

x = -3:0.1:3;
y = -10:0.2:10;
[X,Y] = meshgrid(x,y);
Z = (2-X).^2 + 10*(Y-X.^2).^2;
surf(X,Y,Z)

a= 2;
b= 10;

f = @(v) (a-v(1))^2 + b*(v(2) - v(1)^2)^2;

A1 = f([1;10])

v0 = [1;10];
A2 = fminsearch(f,v0)

% hold on
% plot(A2(1),A2(2),'r*')

gradf = @(v) [2*(v(1)-a) + 4*b*v(1)*(v(1)^2-v(2)); 2*b*(v(2)-v(1)^2)];

A3 = gradf(v0)

A4 = norm(A3,'inf')

phi = @(t) v0 - t*gradf(v0);
A5 = phi(0.1)
A6 = f(A5)


A7 = fminbnd(@(t) f(phi(t)),0,0.1)
A8 = phi(A7)

tolerance = 10^(-4);
v = v0;
iterations = 0;




while norm(gradf(v),'inf') > tolerance
    
    phi = @(t) v - t*gradf(v);
    tmin = fminbnd(@(t) f(phi(t)), 0, 0.1);
    v = phi(tmin);
    iterations = iterations + 1;
    
end


A9 = v
A10 = iterations

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
