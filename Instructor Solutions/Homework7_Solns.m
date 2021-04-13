% Homework 7 Solutions
clear all; close all; clc;

% Problem 1
load('Plutonium.mat')

dt = t(2)-t(1);
A1 = (-3*P(1)+4*P(2)-P(3))/(2*dt);
save('A1.dat','A1','-ascii')

A2 = (P(17)-P(15))/(2*dt);
save('A2.dat','A2','-ascii')

A3 = (3*P(end)-4*P(end-1)+P(end-2))/(2*dt);
save('A3.dat','A3','-ascii')

P_prime = zeros(1,length(t));
P_prime(1) = A1;
P_prime(end) = A3;
P_prime(2:end-1) = (P(3:end)-P(1:end-2))/(2*dt);
DecayRates = -P_prime./P;

lambda = mean(DecayRates);
save('A4.dat','lambda','-ascii')

halflife = log(2)/lambda;
save('A5.dat','halflife','-ascii')

% Problem 2 
load('BloodFlow.mat')

Q = trapz(r,2*pi*r.*v);
save('A6.dat','Q','-ascii')

dr = r(2)-r(1);
A = dr*sum(2*pi*r(2:end));
save('A7.dat','A','-ascii')

v_avg = Q/A;
save('A8.dat','v_avg','-ascii')

% Problem 3 (Cardiac output)
load('Dye.mat')

dt = t(2)-t(1);
A9 = dt/3*(c(1) + 4*sum(c(2:2:end-1)) + 2*sum(c(3:2:end-2)) + c(end));
save('A9.dat','A9','-ascii')

C_0 = 2/A9;
save('A10.dat','C_0','-ascii')


