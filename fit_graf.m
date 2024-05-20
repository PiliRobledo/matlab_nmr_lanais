%% ajustacion funcion %%

function [T1,T2,A,B]=fit_graf(a,b,X,Y)

if b==1
switch a
    case 1 % Decaimiento T2
        K="A*exp(-(x/T1))";
    case 2 % IR
        K="A*(1-2*exp(-(x/T1)))";
    case 3 % SR
        K="A*(1 - exp(-x/T1))";
    case 4 % Diff
        K= "A*exp(-x*T1)";
    otherwise
        error('Le erraste rey, Elegi un numero del 1 al 4. 1=T2, 2=IR, 3=SR, 4=diff');
end

[C]=fit(X,Y,K);
T1=C.T1;
A=C.A;
T2=0;
B=0;

switch a
    case 1 % Decaimiento T2
        y1=A*exp(-(X/T1));
    case 2 % IR
        y1=A*(1-2*exp(-(X/T1)));
    case 3 % SR
        y1=A*(1 - exp(-X/T1));
    case 4 % Diff
        y1= A*exp(-X*T1);
end
plot(X,Y,"ro","displayname","Data")
hold on
plot(X,y1,"displayname","ajuste exponencial")
hold off
end