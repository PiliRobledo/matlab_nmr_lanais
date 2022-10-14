function [T1T2]=reshape_T1T2(T1T2_data,T1T2bck,T1T2_t1,T1T2_t2)

T1T2_data = reshape(T1T2_data(:,1),[length(T1T2_t2),length(T1T2_t1)]);
if T1T2bck~=0
    bck = reshape(T1T2_data(:,1),[length(T1T2_t2),length(T1T2_t1)]);
    data2D=T1T2_data-bck;
else
    data2D=T1T2_data;
end
    
T1T2=data2D;

end


