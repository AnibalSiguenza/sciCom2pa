%% Parameters
clc
clear

x0 = 0;
x1 = 1;

N = 16;
h = 1/N;

Niter = 10;
w = .75;
%% Initialization
MAKk = 16;
x = 0:h:1;

error = zeros(Niter + 1, MAKk);
%% Computation
for k = 1:MAKk
    u = sin(pi * k * x);
    error(1, k) = max(abs(u));
    for i = 1:Niter
        u(2:end-1) = .5*w*(u(1:end-2) + u(3:end)) + (1-w)*u(2:end-1);
        error(i+1, k) = max(abs(u));
    end
end
%% plots
figure(1)
clf
hold on 
plot(error)
legend({'1', '2', '3', '4', '5', '6', '7'})
%legend({'1', '3', '7'})
set(gca,'fontsize', 18)

error(1,:)./error(2,:)
