function [ turnedpic ] = turn( sobelpic )
%auther:熊俊峰
%measuresym 测量图片的对称程度
%   特别是用于经过sobel算子边缘检测后的图像，即检测图像的轮廓对称性

A=sobelpic;
[M N]=size(A);
turnedpic=double(A);

for i=1:M
    for j=1:N/2
        tmp=turnedpic(i,j);
        turnedpic(i,j)=turnedpic(i,N-j);
        turnedpic(i,N-j)=tmp;
    end
end         %   tmppic的图片经过双层循环遍历作用水平翻转了
turnedpic=uint8(turnedpic);