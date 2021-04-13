clear all; close all; clc;
% Homework 2

%% Problem 1

f = @ (x) x.^5-2*x.^4+3*x.^3-2*x.^2+x-cos(30*x);
tolerance = 10^(-10);
left = 0;
right = 1.2;

A1 = f(left)*f(right);
save('A1.dat','A1','-ascii')

for j = 1:1000
   
    midpoint = (left+right)/2;
    
    if abs(f(midpoint)) < tolerance
        break
    elseif f(midpoint)*f(left) < 0
        right = midpoint;
    else
        left = midpoint;
    end
    
end

save('A2.dat','midpoint','-ascii')
save('A3.dat','j','-ascii')

%% Problem 2
P = @ (P,r) r*P*(1-P);

P_0 = 0.3;
r = 2.5;

P1_vec = zeros(1,101);
P1_vec(1) = P_0;
for j = 1:100
    P1_vec(j+1) = P(P1_vec(j),r);
end


r = 3.2;
P2_vec = zeros(1,101);
P2_vec(1) = P_0;
for j = 1:100
    P2_vec(j+1) = P(P2_vec(j),r);
end

r = 3.5;
P3_vec = zeros(1,101);
P3_vec(1) = P_0;
for j = 1:100
    P3_vec(j+1) = P(P3_vec(j),r);
end

P_mat = [P1_vec(99:101); P2_vec(99:101); P3_vec(99:101)];
save('A4.dat','P_mat','-ascii')

is_equilibrium = zeros(1,15);
equilibrium_value = zeros(1,15);
r = 2:0.1:3.4;
for ind = 1:length(r)

    P_new = P_0;
    for j = 1:501
        P_old = P_new;
        P_new = P(P_old,r(ind));
    end
    
    if abs(P_new-P_old) < 10^(-8)
        is_equilibrium(ind) = 1;
        equilibrium_value(ind) = P_new;
    end
        
end

save('A5.dat','is_equilibrium','-ascii')
save('A6.dat','equilibrium_value','-ascii')

%% Problem 3
P = [1; 0; 0; 0];

save('A7.dat','P','-ascii')

T = [0.99 0 0.1 0; 0 0.56 0.22 0.36; 0.01 0.25 0.38 0.15; 0 0.19 0.3 0.49];

for t = 1:100
    P = T*P;
    
    if abs(P(1)) < 0.8
        break
    end
    
end

save('A8.dat','t','-ascii')
save('A9.dat','P','-ascii')

p_old = [1; 0; 0; 0];
for t = 1:1000
    p_new = T*p_old;
    
    if norm(p_new-p_old) < 10^(-16)
        break
    end
    
    p_old = p_new;
end

save('A10.dat','p_new','-ascii')
