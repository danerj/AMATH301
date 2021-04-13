clear all
close all
clc


%%%%%%% Problem 1 %%%%%%%

load('Plutonium.mat')

% Second order Forward Difference :
% f'(x) = -3f(x) + 4f(x+dx) - f(x+2dx) / 2dx + error
% error = 2 (dx)^2 / 3! * f'''(x)

dt = 1;

A1 = (-3*P(1) + 4*P(1+dt) - P(1+2*dt)) / (2*dt)

% Centered Difference:
% f'(x) f(x+dx) - f(x-dx) / 2dx

% To approximate derivative at t = 10, we have to think about t(11)
% to account for '1' indexing in matlab.

A2 = (P(11+dt) - P(11-dt)) / (2*dt)


% Second Order Backward Difference :
% f'(x) = 3f(x) - 4f(x-dx) + f(x-2dx) / 2dx + error
% error = 2 (dx)^2 / 3! * f'''(x)

A3 = (3*P(end) - 4*P(end - dt) + P(end - 2*dt)) / (2*dt)

% Decay Rate = -1/P dP/dt
 
Decay_Rates = zeros(1,length(P));
Decay_Rates(1) = -A1 / P(1);
Decay_Rates(end) = - A3 / P(end);

% Looping version of the answer

% for ii = 2:length(Decay_Rates)-1
%     
%     Decay_Rates(ii) = -(P(ii+dt) - P(ii-dt)) / (P(ii)*2*dt);
% 
% end

% vectorized solution

decay_rates_interior = -(P(3:end) - P(1:end-2)) ./ (P(2:end-1)*2*dt);
Decay_Rates(2:end-1) = decay_rates_interior;


%plot(t,Decay_Rates,'o')

A4 = mean(Decay_Rates)
A5 = log(2) / A4

%%%%%%% Problem 2 %%%%%%%%

% Q = int_{0}^{R} 2*pi*r*v(r) dr

load('BloodFlow.mat')


% Using for loop :

% trap_sum = 0;
dr = r(2)-r(1);
% 
% for ii = 1:length(v)-1
%     
%     trap_sum = trap_sum + 2*pi*r(ii)*v(ii) + 2*pi*r(ii+1)*v(ii+1);
%     
% end
% 
% trap_sum = trap_sum*dr/2;

% Or use the vectorized answer : 

trap_sum2 = sum(2*pi*dr/2*(r(1:end-1).*v(1:end-1) + r(2:end).*v(2:end)));
A6 = trap_sum2

% You can also just cheat and use the built in trapz command:
%trapz(r,2*pi*r.*v)

Area = 0;

for ii = 2:length(r)

Area = Area + 2*pi*r(ii);

end


Area = Area*dr;

A7 = Area

A8 = A6 / A7

%%%%%%%% Problem 3 %%%%%%%

load('Dye.mat')

simpson_sum = 0;

for ii = 2:2:length(c)-1
    
    simpson_sum = simpson_sum + c(ii-1)+4*c(ii)+c(ii+1);
    
end

dt = t(2)-t(1);

simpson_sum = dt*simpson_sum / 3;
A9 = simpson_sum

A = 2;

A10 = 2 / A9

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