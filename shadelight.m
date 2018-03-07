function NewGray=shadelight(Gray)
tmp=double(Gray);
[M N]=size(tmp);
sum=0;
NewGray=zeros(M,N);
for i=1:M
    for j=1:N
        sum=sum+tmp(i,j);
    end
end
m=sum/(M*N)
sum=0;
for i=1:M
    for j=1:N
        sum=sum+(tmp(i,j)-m)^2;
    end
end
d=sqrt(sum/(M*N))
for i=1:M
    for j=1:N
        NewGray(i,j)=(tmp(i,j)-m)/sqrt(d);
    end
end
