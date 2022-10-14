%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Es una herramienta para ver la humedad de las muestras %
%  Usamos la CPMG y la iTL para ver la cantidad de agua  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all, clear, clc,

cd("C:\Users\Pili Robledo\Desktop\doctorado\Esteban Team\220728_carbon_nafion\CPMG_MOUSE")    % indicar dirección del conjunto de datos de secado

A=1 ; % inicio de seguimiento
B=12; % Final de seguimiento

Nx=200;
T= logspace(-2,3,Nx)'; 
alpha=1E-1;

figure(1)
set(gca,'xscale','log')
hold on
legend

%% seguimiento con graficas
for i=A:B
    try
        filename="./"+num2str(i); %si estan en carpetas separadas 
        cd(filename);
        data=load("data.csv");
        cd ..
        tau1=data(:,1);
        Z=data(:,2);
        
        
        % -------------------KERNEL-----------------------------------

        K1=kernel(1,tau1,T,0,0);

        % -------------------TL----------------------------------------
        [S,resida] = flint1D(K1,Z,alpha);
        
        plot(T,S,"displayname","paso "+num2str(i))
        title('Distribuciones de T_{2}')
        
        
    catch
        warning("No hay carpeta "+num2str(i)+" Rey")
    end
    grid on
end