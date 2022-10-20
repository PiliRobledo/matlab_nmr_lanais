clc;
clear all;
close all;
    
cd("C:\Users\Pili Robledo\Desktop\doctorado\pm5\221018_muestra1n\SSE_Dec\1")


load data2D.dat
Z=data2D';


% Z=Z(1:200,1:45);

alpha=1e-3;
%% *************************** D(MOUSE) - T2 *******************

Nx = 100;      % number of bins in relaxation time grids
Ny = 100;     

T1 = logspace(-1,4,Nx)';  %T2
T2 = logspace(-2,2,Ny)';  %dif

load T2Axis.dat;
load DiffAxis.dat;

tau1=T2Axis(1:end);%200);%(1:end);

%hay que descoemntar para elimino un punto de la dimension 
tau2=DiffAxis(1:end);%45);%(5:end); %dif

K1 = kernel(1,tau1,T1,0,0);  % T2 relaxation data  (1=dif)
K2 = kernel(4,tau2,T2,0,0);  % Difusion




%% graficar

[S,resida] = flint(K1,K2,Z,alpha);

S=mascara_marco_ceros(S,2);
S=compuerta_atenuadora(S,4);
% S=mascara_diff(S,T2,2.9,10);



%ploteo posta
figure
%T22=pi*sqrt(2.15e-9*T2)*1e6;
T22=T2;
subplot(1,3,1)
contour(T1,T22,S', 60)
set(gca,'YScale','log')
set(gca,'XScale','log')

xlabel('T_{2} [ms]')
ylabel('D [10^-9m^2/s] ')
%dim1=length(tauDir);
%dim1=length(T2AxisMovil);
%dim1=length(Ddir);
%dim1=length(T1);


 a=sum(S);
%  a=a';
%  T2=T2';
%  T22=T22';
 St=S';
 b=sum(St);
%  b=b';
%  T1=T1';

 
 subplot(1,3,2)
 plot(T22,a)
 hold on
 set(gca,'XScale','log')
[pks,locs]=findpeaks(a,T22);
findpeaks(a,T22);
text(locs,pks,num2str(locs))
 xlabel('D [10^-9m^2/s] ')%('T_{1}[ms]')
 hold off
 
 subplot(1,3,3)
 plot(T1,b)
 hold on
 set(gca,'XScale','log')
[pks,locs]=findpeaks(b,T1);
findpeaks(b,T1);
text(locs,pks,num2str(locs))
 xlabel('T_{2} [ms]')
hold off
%  figure; contour3(T1,T22,S', 10000);
%  set(gca,'YScale','log')
% set(gca,'XScale','log')
%ploteo en numero de puntos

figure;
 surf(tau2, tau1, Z)
 
 
 
 
