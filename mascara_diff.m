function [A]=mascara_diff(B,Daxis,d,c)
%d es la diffusión que usamos de referencia
c=c/100; % porcentaje extra 
d=d*(1+c);
D=Daxis<=d;
A=D.*B;% recortamos todo lo que esté despues de d 
% A=A';
end