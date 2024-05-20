function A=guarda_T1(a,b) % a podemos decir cuanto porcentaje del largo tomar,b nombre a cargar
  

b=ls("*t1.txt");
T1=load(b);       % Cargar T1


if nargin>1         % nombre del archivo
     data=load(b);
    else
      data=ls("*corregido.dat");
      data=load(data);    % cargar data 
end

if nargin>0         %cuantos puntos tomamamos??
     data=data(1:round(length(data)*a/100),:);
 else
    data=data(1:length(data)/2,:); 
end

data=sum(data)/length(data);


T1_dot=[];

for i=1:length(T1)
    T1_dot=[T1_dot; data(:,(2*i-1)) data(:,(2*i))];
end


T1=[T1,T1_dot];

save('T1_graph.dat','T1','-ascii');
% figure
% plot(T1(:,1),T1(:,2),".-")

FIT_IR_2_componentes(T1(:,1),T1(:,2))

end