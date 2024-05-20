function T1=T1_duracion(Tmin, Tmax, delay,n,nscans)
Tmin=log10(Tmin);
Tmax=log10(Tmax);
t=sum(logspace(Tmin,Tmax,n));
T1=t*nscans+delay*n*nscans;
T1=T1/1000/3600;
end
