function guarda_matriz_T1T2_minispec()

clc;
clear all;
close all;
a=ls("*data.txt");
b=ls("*t1.txt");
c=ls("*t2.txt");


%% bloque de carga de bck
d=ls("*data-bck.txt");
bck=load(d);       % cargar bck
%%
load(a);    % cargar data
load(b);       % Cargar T1
load(c);       % Cargar T2

% load bck-data.txt;      % bckground

T1T2_data=T1T2_data-bck;

T1T2_data_real = reshape(T1T2_data(:,1),[],length(T1T2_t1));
T1T2_data_imag = reshape(T1T2_data(:,2),[],length(T1T2_t1));
T1T2=[];

    for i=1:length(T1T2_t1)
        T1T2=[T1T2 T1T2_data_real(:,i) T1T2_data_imag(:,i)];
    end
save('T1T2-data.dat','T1T2','-ascii');
end