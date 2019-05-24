S=''
openr,1,'C:/Users/b1017136/Desktop/horizons_results.txt'
for i = 0, 30000 do begin
readf,1,s
if s eq '$$SOE' Then goto,stop1

endfor
stop1:
;readf,1,s
;readf,1,s
;print,s
;s1=strsplit(s,'=',/EXTRACT)

;s2=strsplit(s1[1],' ',/EXTRACT)
;s3=strsplit(s1[2],' ',/EXTRACT)




;print,s2[0],s3[0],s1[3]

N=365*36L+7
x=dblarr(N)
y=x
z=x
;x[0]=float(s2[0])

;y[0]=float(s3[0])
;z[0]=float(s1[3])

for i=0L,N-1 do begin


readf,1,s
readf,1,s

s1=strsplit(s,' =',/EXTRACT)

;s2=strsplit(s1[1],' ',/EXTRACT)
;s3=strsplit(s1[2],' ',/EXTRACT)

;read,ddd
x[i]=s1[1]
y[i]=s1[3]
z[i]=s1[5]



endfor

;save,x,y,z,filename='C:/Users/b1017136/Desktop/horizon.sav'
window,0
plot,x,y,/nodata,xtitle='x',ytitle='y',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
oplot,x,y,color='FF0000'x

window,1
plot,y,z,/nodata,xtitle='y',ytitle='z',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
oplot,y,z,color='00FF00'x
window,2
plot,x,z,/nodata,xtitle='x',ytitle='z',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
oplot,x,z,color='0000FF'x

set_plot,'PS'
device,filename='ft.ps'
device,/color,decomposed=1,filename='C:\Users\b1017136\Desktop\pro.ps'
plot,x,y,/nodata,xtitle='x',ytitle='y',/xstyle,/ystyle,Background='FFFFFF'x,color='000000'x
oplot,x,y,color='FF0000'x

close,1


end
