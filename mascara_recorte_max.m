function [A]=mascara_recorte_max(B,n)
n=n/100; % porcentaje en numero entero

D=B>=n*max(B,[],"all");
E=~D;


A=(n*max(B,[],"all")).*D + E.*B;
end