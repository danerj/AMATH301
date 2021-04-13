clear all
close all
clc

load('SeaPopData.mat')

P1 = polyfit(t,Seattle_Pop,1);

m = P1(1);

b = P1(2);

linear_fit = m*t+b;

plot(t,Seattle_Pop,t,linear_fit)

A1 = m

A2 = sqrt( mean( (Seattle_Pop - linear_fit).^2) )

year2017 = 157;

A3 = m*year2017 + b
    
P2 = polyfit(t,Seattle_Pop,2);

A4 = polyval(P2,year2017)

P3 = polyfit(t,Seattle_Pop,3);

A5 = polyval(P3,year2017)

P9 = polyfit(t,Seattle_Pop,9);

fit_line = polyval(P9,t);

A6 = polyval(P9,year2017)

figure(2)
plot(t,Seattle_Pop,t,fit_line)


A7 = length(t) - 1
poly_interp = polyfit(t,Seattle_Pop,A7);


A8 = polyval(poly_interp,year2017)
fitline = polyval(poly_interp,t)

figure(3)
plot(t,Seattle_Pop,t,fitline)

P_log = polyfit(t,log(Seattle_Pop),1);
a = exp(P_log(2));
r = P_log(1);
fit_line = a*exp(r*t);

figure(4)
plot(t,Seattle_Pop,t,fit_line)

A9 = [a r]

A10 = a*exp(r*year2017)

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

