clear all
close all
clc

A = [4 2; 1 -2]
B = [3 -1; 3 -2]
C = [1 2; 1 -3; -2 3]
D = [1 -3 -2; 1 9 4]
x = [1 0]'
y = [0 1]'
z = [1 -4 2]'

A1 = A+B
A2 = 3*x-2*y
A3 = A*x
A4 = A*(y-x)
A5 = C*x
A6 = C*y+z
A7 = A*B
A8 = B*A

save('A1.dat','A1','-ascii')
save('A2.dat','A2','-ascii')
save('A3.dat','A3','-ascii')
save('A4.dat','A4','-ascii')
save('A5.dat','A5','-ascii')
save('A6.dat','A6','-ascii')
save('A7.dat','A7','-ascii')
save('A8.dat','A8','-ascii')

A9 = A*D
save('A9.dat','A9','-ascii')
A10 = D(:,2)
A11 = C(2:3,:)
A12 = D(2,1:2)
save('A10.dat','A10','-ascii')
save('A11.dat','A11','-ascii')
save('A12.dat','A12','-ascii')

sumx1 = 0;
for k = 1:20000
    sumx1 = sumx1 + 0.1;
end
x1 = abs(2000-sumx1);

sumx2 = 0;
for k = 1:16000
    sumx2 = sumx2 + 0.125;
end
x2 = abs(2000-sumx2);

sumx3 = 0;
for k = 1:10000
    sumx3 = sumx3 + 0.2;
end
x3 = abs(2000-sumx3);

sumx4 = 0;
for k = 1:8000
    sumx4 = sumx4 + 0.25;
end
x4 = abs(2000-sumx4);

A13 = x1
A14 = x2
A15 = x3
A16 = x4

save('A13.dat','A13','-ascii')
save('A14.dat','A14','-ascii')
save('A15.dat','A15','-ascii')
save('A16.dat','A16','-ascii')

% P(t + 1) = rP(t)(1-P(t))

r = 3;

P = zeros(1,101);

P(1) = 0.4;

for idx = 1:length(P)-1
    P(idx+1) = r*P(idx)*(1-P(idx));
end

A17 = P(end)

%plot(P,'o')


save('A17.dat','A17','-ascii')