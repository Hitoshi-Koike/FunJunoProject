S=''
;それぞれ変えてね--------------------------------------
openr,2,'C:/Users/b1017136/Desktop/horizons_results.txt'
;-----------------------------------------------------
for i = 0, 30000 do begin
readf,2,s
if s eq '$$SOE' Then goto,stop1

endfor

stop1:
N=300L;365*50L;+10;36L+9
x=dblarr(N)
y=x
z=x
t=x
for i=0L,N-1 do begin


readf,2,s
;print,s
if s eq '$$EOE' then goto,stop2
;readf,2,s

s1=strsplit(s,' ',/EXTRACT)
;if a eq 1 then do begin
x[i]=s1[7]
;if x[i] - x[i-1] le -300 then a = 1
y[i]=s1[8]



;fileの読み込みを始めるよ
;pro ascii_write
fname='C:/Users/b1017136/Desktop/juno_lat_lot.txt'

openw, lun, fname ;,/get_lun
printf,lun, x
close,lun
free_lun,lun
;fileの読み込みがおわったよ。おつかれ

;new=''
;openw,3,'C:/Users/b1017136/Desktop/juno_lat_lot.txt'

;z[i]=s1[5]
t[i]=i ;mod 365
endfor

stop2:
x = x[0:i-1]
y = y[0:i-1]

;z = z[0:i-1]
N=n_elements(x)

dx=x[1:n-1]-x[0:n-2]
ix=where(abs(dx) gt 100)
x[ix[0]+1:*]+=360
;for i=0L,365 do begin
;t[i]=i
;endfor


;save,x,y,z,filename='C:/Users/b1017136/Desktop/juno.sav'
window,0
;set_plot,'PS'
;device,filename='C:\Users\b1017136\Desktop\ft.ps'
;y is latitude (r)
;x is longitude (theta)
x =x/360*2*!dpi
plot,y*cos(x),y*sin(x);,/nodata,xtitle='x',ytitle='y',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
;oplot,x,y,color='FF0000'x

;window,1
;plot,y,z,/nodata,xtitle='y',ytitle='z',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
;oplot,y,z,color='00FF00'x

;window,2
;plot,x,z,/nodata,xtitle='x',ytitle='z',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
;oplot,x,z,color='0000FF'x
;window,3
;plot,t,x,/nodata,xtitle='t(day)',ytitle='x',/xstyle,/ystyle,Background='FFFFFF'x,color='000000';x,yrange=[-0.01,0.01]
;oplot,t,x,color='000FF0'x
;
;window,4
;plot,t,y,/nodata,xtitle='t(day)',ytitle='y',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
;oplot,t,y,color='00F0F0'x


;window,5
;plot,t,z,/nodata,xtitle='t(day)',ytitle='z',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
;oplot,t,z,color='0FF000'
;


;window,6
;surface,dist(100),/nodata,/xstyle,/ystyle,/zstyle

;plots,10,indgen(100),indgen(100),/t3d,PSYM=0,color='FF0000'


close,2
end
