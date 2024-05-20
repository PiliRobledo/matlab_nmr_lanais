clc; close all; clear


cd("C:\Users\Pili Robledo\Desktop\doctorado\pm5\221104_muestra3n\profile\10")

load profile.dat
deep=flip(profile(:,1));
signal=flip(profile(:,2));

noise=max(signal)*0.1% agregamos nivel de ruido 
figure
hold on
plot(deep,signal)
noise_lin=refline(0,noise);
noise_lin.Color="b";
noise_lin.LineStyle="--"
findpeaks(signal,deep,'MinPeakProminence',noise); %% que sea un porcentaje del maximo la prominencia
[pks pos]=findpeaks(signal,deep,'MinPeakProminence',noise);
ylabel("signal [u.a.]")


%% graficar decaimientos en cada punto 

[pks loc] = findpeaks(signal,'MinPeakProminence',noise);
decay=load("profile-decays.dat");
t=decay(:,1);
figure
hold on
grid on
for i=1:length(loc)
    x=decay(:,(loc(i)+1));
    
    plot(t,x,"o-","DisplayName","posición "+ num2str(pos(i)),"linewidth",2)
    legend
end
