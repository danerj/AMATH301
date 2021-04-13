clear all
close all
clc

%%%%% Problem 1 %%%%%

% (a)

A = imread('arnold01.jpg');
A = double(rgb2gray(A));
%imagesc(A)
%colormap(gray)

[U,S,V] = svd(A,'econ');
singular_values = diag(S);
A1 = singular_values(1:10)
A2 = sum(A1)/sum(singular_values)

% (b)

r = 0;
cumulative_energy = 0;

while cumulative_energy < 0.5
    
    r = r + 1;
    cumulative_energy =  sum(singular_values(1:r))/sum(diag(S));
    
end

A3 = r

A_low_rank = U(:,1:r)*S(1:r,1:r)*(V(:,1:r)).';
A4 = norm(A-A_low_rank)

% (c)

while cumulative_energy < 0.9
    
    r = r + 1;
    modes_vector = singular_values(1:r);
    cumulative_energy = sum(modes_vector)/sum(diag(S));
    
end

A5 = r;

A_low_rank = U(:,1:r)*S(1:r,1:r)*(V(:,1:r)).';
%imagesc(A_low_rank)
A6 = norm(A-A_low_rank)


%%%%% Problem 2 %%%%%

% (a)

load('NoisyImage.mat')

A7 = norm(A-A_noise)

[U,S,V] = svd(A_noise,'econ');

A8 = S(1,1)

% (b)

A9 = (S(1,1) + S(2,2))/ sum(diag(S))
A_low_rank = U(:,1:2)*S(1:2,1:2)*(V(:,1:2)).';
A10 = norm(A-A_low_rank)

%imshow(A_low_rank)


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