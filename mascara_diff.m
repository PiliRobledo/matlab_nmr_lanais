function [A]=mascara_diff(B,Daxis,d,c)
%d es la diffusi�n que usamos de referencia
c=c/100; % porcentaje extra 
d=d*(1+c);
D=Daxis<=d;
A=D.*B;% recortamos todo lo que est� despues de d 
% A=A';
end