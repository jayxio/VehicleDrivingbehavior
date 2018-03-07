function [ sym ] = measuresym( sobelpic )
%auther:熊俊峰
%measuresym 测量图片的对称程度
%   特别是用于经过sobel算子边缘检测后的图像，即检测图像的轮廓对称性
sym=0;
A=imresize(sobelpic,[250 200]);
[M N]=size(A);
tmppic=double(A);
tmppic1=double(A);
for i=1:M
    for j=1:N/2
        tmp=tmppic(i,j);
        tmppic(i,j)=tmppic(i,N-j);
        tmppic(i,N-j)=tmp;
    end
end         %   tmppic的图片经过双层循环遍历作用水平翻转了
tmppic1=abs(tmppic1-tmppic);
sym=sum(sum(tmppic1)');