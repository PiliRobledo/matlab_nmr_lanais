clc;
clear all;
close all;

cd('C:\Users\Pili Robledo\Desktop\doctorado\minispec\robledo_flores\230228_H20')
arrhe=[]

for T=253:10:353 
 close all
filename="./"+num2str(T)+"/T1/1"
cd(filename);


T1FID=load("T1Sr-FID.txt");    % cargar data
T1_axis=load("T1Sr-FID_t1.dat");       % Cargar T1
FID_axis=load("T1Sr-FID_t2.dat");       % Cargar T2

%  data2D=data2D(:,2:end); %saca el primer punto
%  T2xT2=T2xT2_data(:,1);
% T1FID=T1FID(1:500,:);

data2D = reshape(T1FID(:,1),[length(FID_axis),length(T1_axis)]);
data2D_im = reshape(T1FID(:,2),[length(FID_axis),length(T1_axis)]);


        phi=fase_test(data2D(1:200,length(T1_axis)),data2D_im(1:200,length(T1_axis)),10000);  %angulo de corrección%
        Z_c=(data2D+j*data2D_im)*exp(j*phi);
        Z=real(Z_c);
%         Z=data2D;
% Z=Z(1:500,:);
figure
plot(Z(:,length(T1_axis)),"displayname","real")
hold on
plot(imag(Z_c(:,length(T1_axis))),"displayname","imaginario")
legend
grid on
saveas(gcf,"T1_fid",'png');
z=sum(Z(1:100,:))/length(Z(1:100,:));

figure
plot(T1_axis,z',"b.", "DisplayName",num2str(T))
legend
hold on


gaussEqn = 'a*(1-exp(-x/T1))+y0';

f1 = fit(T1_axis,z',gaussEqn,'StartPoint',[50 1500 5])
pause(1)

grid on 
plot(T1_axis,f1(T1_axis),"-or","DisplayName","Ajuste T1= "+ num2str(f1.T1)+" ms ; y0= " + num2str(f1.y0) )
legend
txt ="corrección de \phi =  "+num2str(phi*180/pi)+" °" ;
text(max(T1_axis),max(z)/4,txt,'HorizontalAlignment','right')
xlabel("T1 [ms]")
saveas(gcf,"T1_h20",'png');

arrhe=[arrhe; T f1.T1]

cd ..; cd .. ; cd ..

end
T1=arrhe(:,2);
T=arrhe(:,1);
arrhe=[arrhe, 1./arrhe(:,1) ,1./arrhe(:,2)];
save("arrhe.txt","arrhe","-ascii")
figure
plot(1000./T,1./T1,"s--")