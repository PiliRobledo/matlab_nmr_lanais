function A=guarda_matriz_T1T2_minispec_phase(n,a) % n el numero de pasos entre +60 y - 60 grados

close all;

b=ls("*t1.txt");
T1=load(b);       % Cargar T1


data=ls("*data.dat");

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


T1T2=[];
for i=1:length(T1)
    X=data(:,(2*i-1));% REAL
    Y=data(:,(2*i)); % IMAGINARIA
    
    f4=(X+j*Y)*exp(j*A);
    
    T1T2=[T1T2 real(f4) imag(f4)];
end
    
    


save('T1T2-data-corregido.dat','T1T2','-ascii');
save('phi.txt','phi','-ascii');
figure(1)
hold on
plot(real(f3))
hold on 
plot(imag(f3))
end