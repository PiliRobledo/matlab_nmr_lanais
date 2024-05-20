% límite físico de la matrices 
% porcentaje excedente
function [A]=mascara_fisica(B,T1, T2, n)
n=n/100; % porcentaje en numero entero
D=T1*(1./T2')>=(1-n);
A=D.*B;
end