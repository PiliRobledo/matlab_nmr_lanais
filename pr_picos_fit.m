%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                       %
%          fiteo de picos               %
%                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc; clear; close all

cd("C:\Users\Pili Robledo\Desktop\doctorado\minispec\robledo_flores\230130_carbon_naf\1N")
% cd("C:\Users\Pili Robledo\Desktop\doctorado\NAFION\Pili_NAFION") %% directory 

% cd("H:\Otros ordenadores\My Computer\doctorado\NAFION\Pili_NAFION")

    %% selection folder
tic    
    

%     senal=[];
%     peaks=[];
%     cp1=0.177*1000;          %semilla centro pico 1
%     amp1=0.49*100;         %semilla amplitud pico 1
%     cp2=0.280*1000;          %semilla centro pico 2
%     amp2=0.79*100;         %semilla amplitud pico 2


data=load("data_ilt.txt");
    
    T2=log10(data(:,1));
    y=data(:,2);
%     T2=data(:,1);
    data_ilt=[T2  y];

    [peak loc]=findpeaks(y,T2);
    star=[loc ones(length(loc),1)/3]';
    star=reshape(star,1,length(loc)*2);
    
    %% verificar cual es cual quien es quien
    

     Peaks=peakfit(data_ilt,0,0,3,1,0,3000,star)
       

    

    
    %%
    
    
    
    grid on
%     subplot(2,1,ii)
    hold on;
%     plot(T2,y,'-.','DisplayName',"ITL",'LineWidth',2)
%     set(gca,'XScale','log')
%     subplot(2,2,1); 
%     set(gca,'XScale','log');
    
    trapz(T2,y)
%     plot(t,n,'-','DisplayName',name)
%     plot(t,z,'-','DisplayName',name)
%     title("CPMG")
%     axis([0 1400 0 70])
%     set(gca,'FontSize',30);
%     xlabel('T_{2} [ms]','FontSize',30);
%     legend
    pause(1)
% subplot(2,1,1)
%     set(gca,'XScale','log')

    

    
%     filename="data_peaks_"+name+".txt"
%     save (filename, 'peaks', '-ascii');



tiempo=toc 
