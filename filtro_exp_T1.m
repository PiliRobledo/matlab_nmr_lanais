function y=filtro_exp_T1(senal,lin,a) % introducimos la señal y si el espacio es lineal o logaritmico
[X N]=size(senal);
N;
X;
if lin=="lin"
    x=linspace(1,N,N);
elseif lin=="log"
    x=logspace(0,log10(N),N);
end

y=senal.*(1-exp(-a*x/N));


surf(y)
figure
plot(x,(1-exp(-a*x/N)),"o--")
hold on
plot(x,y)

end
