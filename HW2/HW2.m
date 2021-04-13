clear all
close all
clc

%%% Problem 1 %%%

f = @(x) x.^5-2*x.^4+3*x.^3-2*x.^2+x-cos(30*x);

f_at_0 = f(0);

f_at_1_2 = f(1.2);

A1 = f_at_0*f_at_1_2

save('A1.dat','A1','-ascii')

xspan = linspace(-0.2,1.5,1000);

fx = f(xspan);

%plot(xspan,fx)

% Bisection

left_endpoint = 0;

right_endpoint = 1.2;

tolerance = 10^(-10);

maximum_iterations = 1000;

iterations_count = 0;

f_midpoint = 1;

while abs(f_midpoint) > tolerance && iterations_count < maximum_iterations
    
    midpoint = (left_endpoint+right_endpoint)/2;
    
    iterations_count = iterations_count + 1;
    
    f_midpoint = f(midpoint);
    
    if f_midpoint > 0
        
        right_endpoint = midpoint;
        
    else
        
        left_endpoint = midpoint;
        
    end
    
end

A2 = midpoint

A3 = iterations_count

save('A2.dat','A2','-ascii')

save('A3.dat','A3','-ascii')

%%% Problem 2 %%%

P_initial = 0.3;

r_vector = [2.5 3.2 3.5]';

% Hold population values for years 0,1,2,3,...,100 for the 3 r param's
Populations = zeros(3,101);

Populations(:,1) = P_initial;

for ii = 0:99
    
    P_this_year = Populations(:,ii+1);
    P_next_year = r_vector.*P_this_year.*(1-P_this_year);
    Populations(:,ii+2) = P_next_year;
    
end

A4 = Populations(:,end-2:end)

save('A4.dat','A4','-ascii')

is_equilibrium = zeros(1,15);

equilibrium_value = zeros(1,15);

equilibrium_tolerance = 10^(-8);

for r = 2:0.1:3.4
    
    population = zeros(1,502);
    
    population(1) = P_initial;
    
    for jj = 1:501
        
        population(jj+1) = r*population(jj)*(1-population(jj));
        
    end
    
    if abs(population(end)-population(end-1)) < equilibrium_tolerance
        
        k = int8(10*(r-2)+1);
        
        is_equilibrium(k) = 1;
        
        equilibrium_value(k) = population(end);
        
    end
    
end



A5 = is_equilibrium

A6 = equilibrium_value

save('A5.dat','A5','-ascii')

save('A6.dat','A6','-ascii')

%%% Problem 3 %%%

T = [0.99 0 0.1 0; 0 0.56 0.22 0.36; 0.01 0.25 0.38 0.15; 0 0.19 0.3 0.49];

p = [1 0 0 0]';

A7 = p

save('A7.dat','A7','-ascii')

ineffective_probability = 0.8;

hours = 0;

while p(1) >= ineffective_probability
    
    hours = hours + 1;
    
    p = T*p;
    
end

A8 = hours

A9 = p

save('A8.dat','A8','-ascii')

save('A9.dat','A9','-ascii')

change = 1;

while change >= tolerance
    
    p_old = p;
    p = T*p;
    
    change = norm(p-p_old);
    
end

A10 = p

save('A10.dat','A10','-ascii')