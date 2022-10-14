clc;
clear all;
close all;

cd('C:\Users\Pili Robledo\Desktop\doctorado\Esteban Team\220803_carbon-Nafion\T1T2');

load T1T2-data.txt;    % cargar data
load T1T2-t1.txt;       % Cargar T1
load T1T2-t2.txt;       % Cargar T2

% Z=Z';

Z=reshape_T1T2(T1T2_data,0,T1T2_t1,T1T2_t2);
Z=Z(1:800,:);
alpha=1E0; %cuanto mas chico es el numero, mas iteraciones hace



%% ************************* T1-T2 *************************
% % % % 
Nx = 100;      % number of bins in relaxation time grids
Ny = 100;     


T1 = logspace(0,4,Nx);  %T2
T2 = logspace(0,4,Ny);  %T1

% load T1Axis.dat    % T1 AXIS
% load T2Axis.dat    % T2 AXIS

tau1=T1T2_t2(1:800);    % AXIS T2
tau2=T1T2_t1;    % AXIS T1

K1 = exp(-tau1 *(1./T1) );  % T2 relaxation data   T1f
% K1 = kernel(1,tau1,T1);
% K2 = 1-2*exp(-tau2 *(1./T2) );  % T1 relaxation data   T1f Invertion Recovery
K2 = 1-exp(-tau2 *(1./T2) );  % T1 relaxation data   T1f Saturation Recovery
% K2= kernel(3,tau2,T2);

[S,resida] = flint(K1,K2,Z,alpha);

%% plot


%ploteo posta
figure
%T22=pi*sqrt(2.15e-9*T2)*1e6;
T22=T2;
subplot(1,3,1)
contour(T1,T22,S', 50)
set(gca,'YScale','log')
set(gca,'XScale','log')
% xlabel('T_{2} [s]')
xlabel('T_{2} [ms]')
ylabel('T_{1} [ms] ')
grid on
aux1= refline([1 0]);
aux1.LineStyle="-.";
axu1.Color="black";

aux1= refline([10 0]);
aux1.LineStyle="-.";
axu1.Color="black";

aux1= refline([100 0]);
aux1.LineStyle="-.";
axu1.Color="black"; 
%dim1=length(tauDir);
%dim1=length(T2AxisMovil);
%dim1=length(Ddir);
%dim1=length(T1);
 a=sum(S);
 a=a';
 T2=T2';
 T22=T22';
 St=S';
 b=sum(St);
 b=b';
 T1=T1';

 
 subplot(1,3,2)
 plot(T22,a)
 hold on
 set(gca,'XScale','log')
[pks,locs]=findpeaks(a,T22);
findpeaks(a,T22);
text(locs,pks,num2str(locs))
 xlabel('T_{1}[ms]')%('D [10^-9m^2/s] ')
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


figure;
 surf(tau2, tau1, Z)