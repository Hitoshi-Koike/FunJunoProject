S=''
openr,1,'C:/Users/b1017136/Desktop/project/dat.0515/dat.0515/horizons_results1.txt'
for i = 0, 10000 do begin
readf,1,s
if s eq '$$SOE' Then goto,stop1

endfor
stop1:
readf,1,s
readf,1,s
print,s
s1=strsplit(s,'=',/EXTRACT)

s2=strsplit(s1[1],' ',/EXTRACT)
s3=strsplit(s1[2],' ',/EXTRACT)




print,s2[0],s3[0],s1[3]

N=365*30L+7
x=fltarr(N)
y=x
z=x
x[0]=float(s2[0])

y[0]=float(s3[0])
z[0]=float(s1[3])

for i=1L,N-1 do begin


readf,1,s
readf,1,s

s1=strsplit(s,'=',/EXTRACT)

s2=strsplit(s1[1],' ',/EXTRACT)
s3=strsplit(s1[2],' ',/EXTRACT)


x[i]=s2[0]
y[i]=s3[0]
z[i]=s1[3]

endfor

plot,x,y

close,1
end
