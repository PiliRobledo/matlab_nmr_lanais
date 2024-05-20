%% test fase  devuelve la fase correjida%%%
function A=fase_test(x,y,n,a) % x es real, y imaginario , n el numero de pasos entre +60 y - 60 grados
%% carga de datos %%
f=x+j*y;

 if nargin>3         %cuantos puntos tomamamos??
     f=f(1:round(length(f)*a/100));
 else
    f=f(1:length(f)/2); 
 end

extremos=pi/2;

angulos=linspace(-extremos,extremos,n)';

f_phi=[];
%% selector de angulo%% 

for i=1:n
    f2=f*exp(j*angulos(i));
    f_phi=[f_phi ; sum(f2)];
%     figure
%     hold on
%     plot(real(f2))
%     plot(imag(f2))
%     pause(1)
%     close all
end
figure()
plot(angulos, real(f_phi),"DisplayName", "Real")
hold on
plot(angulos, imag(f_phi),"DisplayName", "Imaginario")
legend
grid on
% hold on
% plot(imag(f_phi))

[mini posit]=min(abs(imag(f_phi)));
A=angulos(posit);
display("angulo de " + num2str(A/(2*pi)*360))
end