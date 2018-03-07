function [ Newpic ] = Sobel( Gray )
%auther:熊俊峰
%Sobel Sobel边缘检测算子在此！现在是分别算水平和垂直方向的梯度
%   结构元素分别为Gx与Gy
%Gx=[-1 0 1;-2 0 2;-1 0 1];
%Gy=[1 2 1;0 0 0;-1 -2 -1];
tmp=double(Gray);
[M N]=size(tmp);%老步骤
Newpicx=ones(M,N);
Newpicy=ones(M,N);
Newpic=ones(M,N);%初始化变量
for i=2:M-1
    for j=2:N-1
        Newpicx(i,j)=tmp(i+1,j-1)+2*tmp(i+1,j)+tmp(i+1,j+1)...
        -tmp(i-1,j-1)-2*tmp(i-1,j)-tmp(i-1,j+1);
        Newpicy(i,j)=tmp(i-1,j-1)+2*tmp(i,j-1)+tmp(i+1,j-1)...
        -tmp(i-1,j+1)-2*tmp(i,j+1)-tmp(i+1,j+1);
        Newpic(i,j)=sqrt(Newpicx(i,j)^2+Newpicy(i,j)^2);
    end
end
 
Newpic=uint8(Newpic);
end

