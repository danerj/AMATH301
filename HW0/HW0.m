clear all
close all
clc

% Exercise 1

x = 10;
y = -2;
z = pi;

A1 = z;
A2 = x+y-z;
A3 = x^3;
A4 = exp(-y);
A5 = cos(z*y);

% Exercise 2

A = [-1 2 1; 3 1 -1];
x = [1 2 -1]';
y = [-2 0 1]';

A6 = x;
A7 = A(2,:);
A8 = x-y;
A9 = A*y;
A10 = A*(x+y);

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
