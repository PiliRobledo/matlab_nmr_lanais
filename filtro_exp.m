function y=filtro_exp(senal,lin) % introducimos la señal y si el espacio es lineal o logaritmico
[N X]=size(senal);
N;
X;

if lin=="lin"
    x=linspace(1,N,N);
elseif lin=="log"
    x=logspace(0,log10(N),N);
end

y=senal.*exp(-4*x/N)';


plot(x,y)

end

