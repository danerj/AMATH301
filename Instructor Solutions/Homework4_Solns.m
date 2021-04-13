% Homework 4
clear all; close all; clc

%% Problem 1
A = diag(2*ones(80,1)) - diag(ones(79,1),1) - diag(ones(79,1),-1);
j = (1:80).';
rho = 2*exp(-50*pi/81)*sin(50*pi*j/81);

D = diag(diag(A));
T = A-D;
lambda = abs(eig(-D\T));
max_lam = max(lambda);

save('A1.dat','max_lam','-ascii')

x0 = ones(80,1);
tol = 1e-4;
[x_Jac, iter] = Jacobi(A,rho,x0,tol,10000);

save('A2.dat','iter','-ascii')

x = A\rho;
error = norm(x-x_Jac,Inf);

save('A3.dat','error','-ascii')

S = tril(A);
T = A-S;
lambda = abs(eig(-S\T));
max_lam = max(lambda);

save('A4.dat','max_lam','-ascii')

[x_GS, iter] = GaussSeidel(A,rho,x0,tol,10000);

save('A5.dat','iter','-ascii')

error = norm(x-x_GS,Inf);

save('A6.dat','error','-ascii')

%% Problem 2
omega = 1.2;

L = tril(A,-1);
P = D/omega+L;
T = A-P;

lambda = abs(eig(-P\T));
max_lam = max(lambda);

save('A7.dat','max_lam','-ascii')

max_lam = zeros(1,100);
omega = 1:.01:1.99;
for k = 1:100
    
    P = D/omega(k)+L;
    T = A-P;
    lambda = abs(eig(-P\T));
    max_lam(k) = max(lambda);
    
end

[min_max_lam ind] = min(max_lam);
optimal = omega(ind);

save('A8.dat','optimal','-ascii')

omega = optimal;
P = D/omega+L;
T = A-P;

x_k = x0; 
iteration = 0; 
error = 2*tol; % 

while error > tol && iteration < 10000
   x_kplus1 = P\(rho-T*x_k);
   error = norm(x_kplus1-x_k,Inf); 
   iteration = iteration+1; 
   x_k = x_kplus1; %
end

save('A9.dat','iteration','-ascii')

error = norm(x-x_k,Inf);

save('A10.dat','error','-ascii')

