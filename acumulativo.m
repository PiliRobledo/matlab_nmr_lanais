function [sum]=acumulativo(S)
% Hace acomulativo de una funci�n
sum=[S(1)];
for k=2:(length(S))
    sum(k)=S(k)+sum(k-1);
end
end