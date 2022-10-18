%% mascara sacadora de ruido %%
% B matriz atenuada 
% C porcentaje de umbral
function [A]=compuerta_atenuadora(B,C)
c=C/100; % pasamos a numero el porcentaje
F=c*max(max(B)); % calculamos umbral
D = B>=F ;
A=B.*D;
end