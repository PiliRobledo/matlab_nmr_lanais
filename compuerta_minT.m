%% mascara recortadora inferior%%
% B matriz atenuada 
% C valor min 
% D eje temporal
function [A]=compuerta_minT(B,D,C)
c=10^C; % pasamos a eje logaritmico
F = D>=c ; % matriz logica
A=B.*F;
end