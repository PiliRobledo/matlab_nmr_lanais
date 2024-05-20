function [a]=integral_trapezoiadal_general(X,Y)
% integral numerica usando el metodo trapezoidal, sin espaciamiento
% uniforme
b=0;
for i=1:(length(X)-1)
    deltax=X(i+1)-X(i);
    b=b+(Y(i+1)+Y(i))*deltax/2;
end
a=b;
display("la integral es " + num2str(a))
end