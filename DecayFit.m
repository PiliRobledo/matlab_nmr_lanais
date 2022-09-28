function [M]=DecayFit(A,tau,T,S,a,b)
%% A tipo de Kernel 
%% tau dato
%% T espacion vectorial de T armado
%%  esta función nos aglomera los ajustes a  la exponecial 
%% a primer punto 
%% b segundo punto (si es cero nos manda al final)


%% bloque de fraccionado


if a==0
        if b==0
            T=T(1:end);
            else
            T=T(1:b);
        end
    else
        if b==0
            T=T(a:end);
            else
            T=T(a:b);
        end
end



%% Etapa de Kernel


K=kernel(A,tau,T,0,0);




%% ajuste con sumatoria sobre K y S

d=length(tau);
Nx=length(T);
M=zeros(size(1:d));


for i=1:d
    for j=1:Nx

          M(i)=M(i)+S(j,1)*K(i,j);

    end
end
M=M';

end



