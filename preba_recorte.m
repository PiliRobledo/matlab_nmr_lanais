% prueba de mascara recorte max
clc, clear, close all

x = linspace(-2,2,100);
y = x';
z = -sin(x.^2 - y.^2);

figure 
surf(z)

figure
z=mascara_recorte_max(z,1);
z=mascara_recorte_T1(z,y,1)
surf(z)