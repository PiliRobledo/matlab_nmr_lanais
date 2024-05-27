function A=filtro_exp(senal) % a limite inferior, b limite superior, Nx cantidad de bins, alpha
N=length(senal)
x=linspace(1,N,N);
y=senal.*exp(-6*(x)/N);


plot(x,y)

end

