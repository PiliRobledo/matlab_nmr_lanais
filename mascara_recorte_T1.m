function [A]=mascara_recorte_T1(B,T1axis,t1max)% t1 en ms

D=T1axis<t1max;


A=D.*B;
end