function H = klasifikasi_KNN(DT, dtTest)
[r,c] = size(DT);
dtJarak = zeros(r,2);
for x = 1 : r
    for y = 1 : (c-1)
        dtJarak(x,1) = dtJarak(x,1) + (dtTest(y)-DT(x,y))^2;
    end
    dtJarak(x,1)=sqrt(dtJarak(x,1));
    dtJarak(x,2) = DT(x,4);
end

temp = 0;
for x = 1 : (r-1)
    for y = 1 : (r-x-1)
        if dtJarak(y,1) > dtJarak(y+1,1)
            temp=dtJarak(y,1);
            dtJarak(y,1)=dtJarak(y+1,1);
            dtJarak(y+1,1)=temp;
            
            temp=dtJarak(y,2);
            dtJarak(y,2)=dtJarak(y+1,2);
            dtJarak(y+1,2)=temp;
            
        end
    end
end

k_NN = 5;
kelas1 = 0;
kelas2 = 0;
for x = 1 : k_NN
    if dtJarak(x,2) == 1
        kelas1 = kelas1 + 1;
    elseif dtJarak(x,2) == 2
        kelas2 = kelas2 + 1;
    end
end

if kelas1 > kelas2
    H = 1;
else
    H = 2;
end
