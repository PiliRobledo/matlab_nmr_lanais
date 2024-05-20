%% T1 de un T1-T2 



%********************************************************************
%
%                      FISTA 1D
%
%      Si tiene un monitor cambie scrsz(3) por 0
        % Diff$
%
%********************************************************************

clc;clear all;close all

cd('C:\Users\Pili Robledo\Desktop\doctorado\minispec\robledo_flores\221011_carbon_naf\1N\T1-T2');


load T1T2-data.txt;    % cargar data
load T1T2-t1.txt;       % Cargar T1
load T1T2-t2.txt;       % Cargar 
% load bck-data.txt;      % bckground


Z=reshape_T1T2(T1T2_data,0,T1T2_t1,T1T2_t2);
Z=Z(1:1000,1:end);
Z=sum(Z)';

% Z=data(1:end);
tau1=T1T2_t1(1:end,1);
% ima=data(1:end,3);
% techo=tau1(2)-tau1(1);
techo=300;

% 
%         phi=fase_test(Z,ima,10000);  %angulo de corrección%
%         Z_c=(Z+j*ima)*exp(j*phi);
%         Z=real(Z_c);

%----------Normalizacion por la masa de muestra---------
masa=1;
Z=Z/masa;           %para comparar 


%-----------------------------------------------------------------
alpha=1E-2;
Nx = 300;      % number of bins in relaxation time grids
T = logspace(1,4,Nx);
T=T';
d=length(tau1);
% -------------------KERNEL-----------------------------------

K1=kernel(3,tau1,T,0,0);

% -------------------TL----------------------------------------
[S,resida] = flint1D(K1,Z,alpha);

% -----------Calcula el decaimiento---------

M=DecayFit(3,tau1,T,S,0,0);


Res=Z-M;


%% ---------------Señal Ruido Bloque--------------------------------

sig=sqrt(mean(Z(1:2).^2));
N=sqrt(mean(Z(d-1:d).^2));
SnR=sig/N;


%------------------PLOTEOS-----------------------------
scrsz = get(groot,'ScreenSize');
close all;
figure%('Position',[scrsz(3) 0 scrsz(3) scrsz(4)*0.92]);
set(gcf, 'Position', get(0, 'Screensize'));
subplot(3,2,2)
semilogx(T,S')
Title="Distribuciones de T_{2}, \alpha = "+num2str(alpha)+", t_{echo}=" + num2str(techo*1000)+" \mus";
title(Title)
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

% save ('data_ilt.txt', 'data_ilt', '-ascii');
% 
% saveas(gcf,"T2_distribution",'jpg');
%

