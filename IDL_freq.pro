function freqs,lc,dt
a=size(lc)
n=a(1)
npsd=n/2l
f=dblarr(npsd)
tlen=dt*n*1.0d0
df=1.0d0/tlen
for i=0l, npsd-1 do begin
f(i)=(i+1)*df
endfor
return, f
end



