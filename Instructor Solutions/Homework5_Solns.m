% Homework 5 Solutions
clear all; close all; clc

load('SeaPopData.mat')

lin_fit = polyfit(t,Seattle_Pop,1);

m = lin_fit(1);
save('A1.dat','m','-ascii')

P_lin = polyval(lin_fit,t);
n = length(t);
sum_squares = sum((Seattle_Pop-P_lin).^2);
rms_error = sqrt(sum_squares/n);
save('A2.dat','rms_error','-ascii')

lin_2017 = polyval(lin_fit,157);
save('A3.dat','lin_2017','-ascii')

quad_fit = polyfit(t,Seattle_Pop,2);
quad_2017 = polyval(quad_fit,157);
save('A4.dat','quad_2017','-ascii')

cub_fit = polyfit(t,Seattle_Pop,3);
cub_2017 = polyval(cub_fit,157);
save('A5.dat','cub_2017','-ascii')

nine_fit = polyfit(t,Seattle_Pop,9);
nine_2017 = polyval(nine_fit,157);
save('A6.dat','nine_2017','-ascii')

deg = n-1;
save('A7.dat','deg','-ascii')

interp = polyfit(t,Seattle_Pop,deg);
interp_2017 = polyval(interp,157);
save('A8.dat','interp_2017','-ascii')

log_Pop = log(Seattle_Pop);
lin_fit = polyfit(t,log_Pop,1);
r = lin_fit(1);
a = exp(lin_fit(2));
A9 = [a r];
save('A9.dat','A9','-ascii')

exp_2017 = a*exp(r*157);
save('A10.dat','exp_2017','-ascii')




