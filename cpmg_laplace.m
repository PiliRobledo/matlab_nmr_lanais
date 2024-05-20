function A=cpmg_laplace(a,b,Nx,alpha) % a limite inferior, b limite superior, Nx cantidad de bins, alpha

f=ls("*corregido.dat");
data=load(f);
acq=importdata("CPMG_acqs.txt");
gain=acq.data(2);


Z=data(1:end,2);



tau1=data(1:end,1);
ima=data(1:end,3);
techo=tau1(2)-tau1(1);

% %----------Ajuste_biexp--------
% [fit, gof] = biexp(tau1,Z);
% correccion por temp
% Z=Z*67/(159.52606-0.34427*i);   %primera correccion con exp
% Z=Z*7/(((i-3)*(1390-842));
% Z=Z/(-1222+7.58*i); %% correccion por area laplace 

%aplica laplace


%-----------------------------------------------------------------
alpha=10^alpha;
% Nx = 400;      % number of bins in relaxation time grids
T = logspace(a,b,Nx);
T=T';
d=length(tau1);
% -------------------KERNEL-----------------------------------

K1=kernel(1,tau1,T,0,0);

% -------------------TL----------------------------------------
[S,resida] = flint1D(K1,Z,alpha);
% S=compuerta_atenuadora(S,4);

% Area=[Area; integral_trapezoiadal_general(T,S)];
% Area2=[Area2; trapz(T,S)];
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

pause(0.1)


%------------------PLOTEOS-----------------------------
% figure(1)
% scrsz = get(groot,'ScreenSize');
set(gcf, 'Position', get(0, 'Screensize'));
% % Title="Distribuciones de T_{2}, \alpha = "+num2str(alpha)+", t_{echo}=" + num2str(techo*1000)+" \mus T= "+num2str(i)+" K";
% % title(Title)
% plot(tau1,Z,"DisplayName",num2str(i)+" K");
% hold on;
% title('Señal')
%----------------------------------------------------------------

%
end