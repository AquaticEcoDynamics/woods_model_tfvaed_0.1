
clear;close;

f='WAVE.nc';
t=datenum(1970,1,1)+double(ncread(f,'time'))/86400;
x=ncread(f,'x');y=ncread(f,'y');
%hs=ncread(f,'hs');

t0=datenum(2015,1,1);
ts=find(abs(t-t0)==min(abs(t-t0)));

