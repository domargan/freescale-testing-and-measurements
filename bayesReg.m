function [ output_args ] = bayesReg( X, y, noise_precision )

[n d] = size(X);

beta = noise_precision;
alfa = [5 0; 0 5];

S_inv = alfa;

for i = 1:n
    
    S_inv = S_inv + beta * [1 X(i); X(i) X(i)^2];
    
end

S = inv(S_inv);

temp = 0;

for i = 1:n
    
    temp = temp + S * [y(i); X(i) * y(i)];
    
end

x = 6:20;

mu = zeros(1, length(x));
sigma = zeros(1, length(x));

for i = 1:length(x)
    
    mu(i) = beta * [1 x(i)] *temp;
    sigma(i) = 1/beta + [1 x(i)] * S * [1; x(i)];
    
end

sd=3*sqrt(sigma);

figure;
[l,p] = boundedline(x, mu, sd);
outlinebounds(l,p);
hold on;
plot(x,mu,'r');
hold on;
scatter(X, y);

end

