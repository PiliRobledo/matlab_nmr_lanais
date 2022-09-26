function [K] = kernel(A,tau,T)
%% A tipo de Kernel
%% tau dato
%% espacio vectorial armado
%% 
switch A
    case 1 % Decaimiento T2
        K=exp(-tau*(1./T));
    case 2 % IR
        K=1-2*exp(-tau*(1./T));
    case 3 % SR
        K=1 - exp(-tau*(1./T));
    case 4 % Diff
        K= exp(-tau*T);
    otherwise
        error('Le erraste rey, Elegi un numero del 1 al 4. 1=T2, 2=IR, 3=SR, 4=diff');
end

end