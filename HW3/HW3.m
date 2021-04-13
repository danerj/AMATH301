clear all
close all
clc

                %%% Problem 1 %%%
R1 = 10;
R2 = 20;
R3 = 5;
R4 = 15;
R5 = 30;
R6 = 25;

A = [R6+R1+R2 -R1 -R2; -R1 R3+R4+R1 -R4; -R2 -R4 R5+R4+R2]

%%%(a)%%%

[L,U,P] = lu(A);

A1 = U*P*L

save('A1.dat','A1','-ascii')

%%%(b)%%%

V1 = 50;
V2 = 0;

% y = L \ V
% I = U \ y

A2 = zeros(1,100);

for V3 = 1:100
    
    V = [V1 V2 V3]';
    
    y = L \ V;
    
    Currents= U \ y;
    
    A2(V3) = Currents(2);
    
end

A2end = A2(end-7:end)

save('A2.dat','A2','-ascii')

%%%(c)%%%

I2vector = zeros(1,100);

for V3 = 1:100
    
    V = [V1 V2 V3]';
    
    Currents = inv(A)*V;
    
    I2vector(V3) = Currents(2);
    
end

A3 = A2-I2vector;

A3end = A3(end-7:end)

save('A3.dat','A3','-ascii')

                %%% Problem 2 %%%

s = sqrt(2)/2;

A = zeros(13,13);

A(1,1) = -s;
A(2,1) = -s;
A(1,2) = 1;
A(3,2) = -1;
A(3,3) = 1;
A(5,3) = -1;
A(5,4) = s;
A(6,4) = -s;
A(7,4) = -s;
A(7,5) = -1;
A(8,5) = 1;
A(8,6) = -1;
A(10,6) = 1;
A(10,7) = -1;
A(12,7) = 1;
A(12,8) = -1;
A(2,9) = -1;
A(13,9) = 1;
A(1,10) = s;
A(2,10) = -s;
A(10,10) = -s;
A(11,10) = s;
A(4,11) = -1;
A(11,11) = 1;
A(5,12) = -s;
A(6,12) = -s;
A(10,12) = s;
A(11,12) = s;
A(6,13) = -1;
A(9,13) = 1;

b = [0,0,0,0,0,0,0,0,4,0,10,0,5]'; 

%%%(a)%%%

[L,U,P] = lu(A);

% WARNING - P IS NOT IDENTITY MATRIX HERE!

y = P \ L \ b;

x = U \ y;

norm(A)
A4 = y

save('A4.dat','A4','-ascii')

A5 = x

save('A5.dat','A5','-ascii')

%%%(b)%%%

x = A\b;

A6 = x

save('A6.dat','A6','-ascii')

%%%(c)%%%

count = 0;
xnormhistory = zeros(1,10);
while norm(x,'inf') <= 30
    
    b(13) = b(13) + 0.01;
    
    x = A \ b;
    
    count = count + 1;
    
    if count >= 1520
        
        xnormhistory(count-1520 + 1) = norm(x,'inf');
        
    end
end

A7 = b(13)

save('A7.dat','A7','-ascii')

                %%% Problem 3 %%%

A = [10^(-20) 1; 1 1];

A8 = cond(A)

save('A8.dat','A8','-ascii')

L = [1 0; 10^20 1];

U = [10^(-20) 1; 0 1-10^20]

A9 = L*U

save('A9.dat','A9','-ascii')

B = [A(2,:); A(1,:)];

L = [1 0; 10^(-20) 1];

U = [1 1; 0 1-10^(-20)];

A10 = L*U

save('A10.dat','A10','-ascii')

