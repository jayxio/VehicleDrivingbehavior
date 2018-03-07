function [ Newpic ] = Sobel( Gray )
%auther:�ܿ���
%Sobel Sobel��Ե��������ڴˣ������Ƿֱ���ˮƽ�ʹ�ֱ������ݶ�
%   �ṹԪ�طֱ�ΪGx��Gy
%Gx=[-1 0 1;-2 0 2;-1 0 1];
%Gy=[1 2 1;0 0 0;-1 -2 -1];
tmp=double(Gray);
[M N]=size(tmp);%�ϲ���
Newpicx=ones(M,N);
Newpicy=ones(M,N);
Newpic=ones(M,N);%��ʼ������
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

