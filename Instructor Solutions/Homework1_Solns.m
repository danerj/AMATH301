% Homework 1 Solutions
clear all; close all; clc;

%% Problem 1
A = [4 2; 1 -2];
B = [3 -1; 3 -2];
C = [1 2; 1 -3; -2 3];
D = [1 -3 -2; 1 9 4];
x = [1; 0];
y = [0; 1];
z = [1; -4; 2];

A1 = A+B;
save('A1.dat','A1','-ascii')

A2 = 3*x-2*y;
save('A2.dat','A2','-ascii')

A3 = A*x;
save('A3.dat','A3','-ascii')

A4 = A*(y-x);
save('A4.dat','A4','-ascii')

A5 = C*x;
save('A5.dat','A5','-ascii')

A6 = C*y+z;
save('A6.dat','A6','-ascii')

A7 = A*B;
save('A7.dat','A7','-ascii')

A8 = B*A;
save('A8.dat','A8','-ascii')

A9 = A*D;
save('A9.dat','A9','-ascii')

A10 = D(:,2);
save('A10.dat','A10','-ascii')

A11 = C(2:3,:);
save('A11.dat','A11','-ascii')

A12 = D(2,1:2);
save('A12.dat','A12','-ascii')

%% Problem 2
x1 = abs(2000-sum(.1*ones(1,20000)));
save('A13.dat','x1','-ascii')

x2 = abs(2000-sum(.125*ones(1,16000)));
save('A14.dat','x2','-ascii')

x3 = abs(2000-sum(.2*ones(1,10000)));
save('A15.dat','x3','-ascii')

x4 = abs(2000-sum(.25*ones(1,8000)));
save('A16.dat','x4','-ascii')

%% Problem 3
r = 3;
P = .4;
for j = 1:100
    P = r*P*(1-P);
end
save('A17.dat','P','-ascii')





