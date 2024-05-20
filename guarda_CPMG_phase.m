function A=guarda_CPMG_phase(n,a) % n el numero de pasos entre +60 y - 60 grados

close all;

data=ls("*cpmg.txt");

data=load(data);    % cargar data

f=data(:,end-1)+j*data(:,end);

figure(1)
plot(real(f))
hold on
plot(imag(f))



%% carga de datos %%


 if nargin>1         %cuantos puntos tomamamos??
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
phi=A/(2*pi)*360;
display("angulo de " + num2str(phi))


f3=(data(:,end-1)+j*data(:,end))*exp(j*A);

T2=[data(:,1) real(f3) imag(f3)];
    
    


save('cpmg-corregido.dat','T2','-ascii');
save('phi.txt','phi','-ascii');
figure(1)
hold on
plot(real(f3))
hold on 
plot(imag(f3))
end