% funcion para sacar info de la escala temporal

function [techo tmax numecho]=pr_info_t(t)
techo= t(2)-t(1);
numecho= length(t);
tmax=max(t);
end