% Homework 3
clear all; close all; clc

%% Problem 1
R = [10 20 5 15 30 25];

% (a)
A = [R(6)+R(1)+R(2) -R(1) -R(2);
    -R(1) R(3)+R(4)+R(1) -R(4);
    -R(2) -R(4) R(5)+R(4)+R(2)];

[L,U,P] = lu(A);

A1 = U*P*L;
save('A1.dat','A1','-ascii')

% (b)
V1 = 50;
V2 = 0;

I_vect = zeros(3,100);
for V3 = 1:100
    b = [V1; V2; V3];
    
    y = L\(P*b);
    I_vect(:,V3) = U\y; 
end

I2 = I_vect(2,:);
save('A2.dat','I2','-ascii')


% (c)
I_vect2 = zeros(3,100);
for V3 = 1:100
    b = [V1; V2; V3];

    I_vect2(:,V3) = inv(A)*b; 
end

I2_2 = I_vect2(2,:);
A3 = I2-I2_2;
save('A3.dat','A3','-ascii')



%% Problem 2

s = sqrt(2)/2;
 
A = zeros(13);
A(1,[1 2 10]) = [-s 1 s];
A(2,[1 9 10]) = [-s -1 -s];
A(3,[2 3]) = [-1 1];
A(4,11) = -1;
A(5,[3 4 12]) = [-1 s -s];
A(6,[4 12 13]) = [-s -s -1];
A(7,[4 5]) = [-s -1];
A(8,[5 6]) = [1 -1];
A(9,13) = 1;
A(10,[6 7 10 12]) = [1 -1 -s s];
A(11,[10 11 12]) = [s 1 s];
A(12,[7 8]) = [1 -1];
A(13,9) = 1;

b = [0; 0; 0; 0; 0; 0; 0; 0; 4; 0; 10; 0; 5];
% (a)
[L,U,P] = lu(A);
y = L\(P*b);
x = U\y;

save('A4.dat','y','-ascii')
save('A5.dat','x','-ascii')

% (b)
x = A\b;
save('A6.dat','x','-ascii')

max_count = 10000;
max_force = 0;
count = 0;
while max_force < 30 && count < max_count
    
    b(13) = b(13)+.01;
    x = A\b;
    max_force = norm(x,Inf);
    count = count + 1;
end

A7 = b(13);
save('A7.dat','A7','-ascii')


%% Problem 3
clear all;

A = [1e-20 1; 1 1];

A8 = cond(A);
save('A8.dat','A8','-ascii')

L = [1 0; 1e20 1];
U = [1e-20 1; 0 1-1e20];
A9 = L*U;
save('A9.dat','A9','-ascii')

B = [1 1; 1e-20 1];

L = [1 0; 1e-20 1];
U = [1 1; 0 1-1e-20];

A10 = L*U;
save('A10.dat','A10','-ascii')

