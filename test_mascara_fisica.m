clc
clear 
close all
N = 3.0;
x=linspace(0, N);
y=2*x;
[X,Y]=meshgrid(x,y);
z=(10/sqrt(2*pi).*exp(-(X.^2/2)-(Y.^2/2)));
surf(X,Y,z);
shading interp
axis tight

z=mascara_fisica(z,x',y',0);

figure
surf(X,Y,z);
xlabel("x")
ylabel("y")
shading interp
axis tight