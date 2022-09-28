%********************************************************************
%
%                      FISTA 1D
%
%      Si tiene un monitor cambie scrsz(3) por 0
%
%********************************************************************

clc;clear all;close all

cd("C:\Users\Pili Robledo\Desktop\doctorado\pm5\220809_carbonNafion\CPMG\2")

% load 'data.dat' % carga de datos
load data.csv;
% T1Sr_FID= reshape(T1Sr_FID(:,1), 12499, []);
data=data;
Z=data(:,2);
tau1=data(:,1);

%----------Normalizacion por la masa de muestra---------
masa=1;
Z=Z/masa;           %para comparar 


%-----------------------------------------------------------------
alpha=1E0;
Nx = 100;      % number of bins in relaxation time grids
T = logspace(0,3,Nx);
T=T';
d=length(tau1);
% -------------------KERNEL-----------------------------------

K1=kernel(1,tau1,T,0,0);

% -------------------TL----------------------------------------
[S,resida] = flint1D(K1,Z,alpha);

% -----------Calcula el decaimiento---------

M=DecayFit(1,tau1,T,S,0,0);


Res=Z-M;


%% ---------------Señal Ruido Bloque--------------------------------

sig=sqrt(mean(Z(1:2).^2));
N=sqrt(mean(Z(d-1:d).^2));
SnR=sig/N;


%------------------PLOTEOS-----------------------------
scrsz = get(groot,'ScreenSize');
close all;
figure%('Position',[scrsz(3) 0 scrsz(3) scrsz(4)*0.92]);
subplot(3,2,2)
semilogx(T,S')
title('Distribuciones de T_{2}')
subplot(3,2,1)
plot(tau1,Z);
hold on;
plot(tau1,M,'r-');
title('Señal+ajuste')
%plot(tau1,Res,'go-');
text(d/2,Z(1)/2,['SNR = ',num2str(round(SnR))])
hold off
subplot(3,2,3)
hold on;
plot(tau1,log(Z),'bo');
plot(tau1,log(M),'r-');
hold off
subplot(3,2,4)
plot(Res,'go-')
title('Residuos')

%----------------------------------------------------------------



save('ILT1D.dat','S','-ascii');
xlabel('T_2') % x-axis label

save('Tiempos.dat','T','-ascii');

data_ilt(:,1)=T;
data_ilt(:,2)=S;



data=data_ilt(:,2);

sum=acumulativo(S);

t=data_ilt(:,1);
subplot(3,2,[5,6])

plot(t,sum/max(sum),'b');
axis tight
hold on;
plot(t,data/max(data));

[pks,locs]=findpeaks(data,t);
findpeaks(data/max(data),t);
%valores=10.^locs;
text(locs,pks/max(data)+0.09,num2str(locs))
set(gca,'XScale','log','FontSize',13);
xlabel('T_{2} [ms]','FontSize',12);
title('T_{2} norm + Cumulativo')
axis tight
hold off

data_ilt(:,3)=sum;

save ('data_ilt.txt', 'data_ilt', '-ascii');
%

