clear all
close all
clc


%%%%% Problem 1 %%%%%

% (a) 

N = 80;

A = toeplitz([2 -1 zeros(1, N-2)], [2 -1 zeros(1, N-2)]);

rho = ones(80,1);

for j = 1:80
    
    rho(j) = 2*exp(-50*pi/81)*sin(50*pi*j/81);
    
end

D = diag(diag(A));

T = A-D;


M = -inv(D)*T;

A1 = norm(eig(M),'inf')

% (b) 

phi_k = ones(80,1);

tolerance = 1e-4;

max_difference = 1;

iterations = 0;

while max_difference >= tolerance
    
    phi_new = D \ (rho - T*phi_k);
    
    iterations = iterations + 1;
    
    max_difference = norm(phi_new-phi_k,'inf');
    
    phi_k = phi_new;
    
end

A2 = iterations

phi_truish = A \ rho;

A3 = norm(phi_k-phi_truish,'inf')

% (c)

S = tril(A);


T = triu(A) - 2*eye(length(A));



M = -inv(S)*T;

A4 = norm(eig(M),'inf')

phi_k = ones(80,1);

max_difference = 1;

iterations = 0;

while max_difference >= tolerance
    
    phi_new = S \ (rho - T*phi_k);
    
    iterations = iterations + 1;
    
    max_difference = norm(phi_new-phi_k,'inf');
    
    phi_k = phi_new;
    
end

A5 = iterations

A6 = norm(phi_truish - phi_k,'inf')

%%%%% Problem 2 %%%%%%

% (a)

omega = 1.2;

L = tril(A) - 2*eye(80);

U = triu(A) - 2*eye(80);

P = D/omega + L;

T = (omega-1)/omega*D + U;

M = -inv(P)*T;

A7 = norm(eig(M),'inf')

% (b)

max_eigenvalues = zeros(100,1);

index = 1;

for omega = 1:0.01:1.99
    
    P = D/omega + L;

    T = (omega-1)/omega*D + U;

    M = -inv(P)*T;
    
    max_eigenvalues(index) = norm(eig(M),'inf');
    
    index = index + 1;
    
end



[value, index] = min(max_eigenvalues);

omegas = 1:0.01:1.99;

A8 = omegas(index)

% (c)

omega = A8;


P = D/omega + L;

T = (omega-1)/omega*D + U;

phi_k = ones(80,1);

max_difference = 1;

iterations = 0;


while max_difference >= tolerance
    
    phi_new = P \ (rho - T*phi_k);
    
    iterations = iterations + 1;
    
    max_difference = norm(phi_new-phi_k,'inf');
    
    phi_k = phi_new;
    
end

A9 = iterations

A10 = norm(phi_truish - phi_k,'inf')

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