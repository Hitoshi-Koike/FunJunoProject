
S=''
openr,2,'C:/Users/b1017136/Desktop/horizons_results.txt'
for i = 0, 30000 do begin
readf,2,s
if s eq '$$SOE' Then goto,stop1

endfor
stop1:
N=365*50L;+10;36L+9
x=dblarr(N)
y=x
z=x
t=x
for i=0L,N-1 do begin


readf,2,s
if s eq '$$EOE' then goto,stop2
readf,2,s

s1=strsplit(s,' =',/EXTRACT)

x[i]=s1[1]
y[i]=s1[3]
z[i]=s1[5]
t[i]=i ;mod 365
endfor

stop2:
x = x[0:i-1]
y = y[0:i-1]
z = z[0:i-1]
N=n_elements(x)

;for i=0L,365 do begin
;t[i]=i
;endfor

;save,x,y,z,filename='C:/Users/b1017136/Desktop/horizon.sav'
window,0
;set_plot,'PS'
;device,filename='C:\Users\b1017136\Desktop\ft.ps'
plot,x,y,/nodata,xtitle='x',ytitle='y',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
oplot,x,y,color='FF0000'x

window,1
plot,y,z,/nodata,xtitle='y',ytitle='z',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
oplot,y,z,color='00FF00'x

window,2
plot,x,z,/nodata,xtitle='x',ytitle='z',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
oplot,x,z,color='0000FF'x

window,3
plot,t,x,/nodata,xtitle='t(day)',ytitle='x',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
oplot,t,x,color='000FF0'x

window,4
plot,t,y,/nodata,xtitle='t(day)',ytitle='y',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
oplot,t,y,color='00F0F0'x


window,5
plot,t,z,/nodata,xtitle='t(day)',ytitle='z',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
oplot,t,z,color='0FF000'x
;set_plot,'PS'
;device,filename='ft.ps'
;device,filename='C:\Users\b1017136\Desktop\ft.ps'
;plot,x,y;,xtitle='x',ytitle='y',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
;oplot,x,y,color='FF0000'x

set_plot,'PS'
device,filename='C:\Users\b1017136\Desktop\xy1cyc.ps'
device,/color
plot,x,y,/nodata,title='xy',xtitle='x',ytitle='y',/xstyle,/ystyle
oplot,x,y
device,/close

set_plot,'PS'
device,filename='C:\Users\b1017136\Desktop\yz1cyc.ps'
device,/color
plot,y,z,/nodata,title='yz',xtitle='y',ytitle='z',/xstyle,/ystyle
oplot,y,z
device,/close

set_plot,'PS'
device,filename='C:\Users\b1017136\Desktop\xz1cyc.ps'
device,/color
plot,x,z,/nodata,title='xz',xtitle='x',ytitle='z',/xstyle,/ystyle
oplot,x,z
device,/close

set_plot,'PS'
device,filename='C:\Users\b1017136\Desktop\xt1cyc.ps'
device,/color
plot,t,x,/nodata,title='t(day)x',xtitle='t(day)',ytitle='x',/xstyle,/ystyle
oplot,t,x
device,/close

set_plot,'PS'
device,filename='C:\Users\b1017136\Desktop\yt1cyc.ps'
device,/color
plot,t,y,/nodata,title='t(day)y',xtitle='t',ytitle='z',/xstyle,/ystyle
oplot,t,y
device,/close

set_plot,'PS'
device,filename='C:\Users\b1017136\Desktop\zt1cyc.ps'
device,/color
plot,t,t,/nodata,title='t(day)z',xtitle='t',ytitle='z',/xstyle,/ystyle
oplot,t,z
device,/close
set_plot,'win'
;graph is fin

;fourier
sp=fft(x,-1)
;plot,sp
;plot,abs(sp);n points
plot,abs(sp[0:100]),psym=-4
window,6
plot,abs(sp[n-100:*]),psym=-4
window,7
plot,abs(sp[0:*]),psym=-4
;window,8
;plot,sp






;help,!d
;device,/close
;set_plot,'win'

close,1
end
