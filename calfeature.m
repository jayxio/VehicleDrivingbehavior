function [ parameters ] = calfeature( picRBG )
%calfeature 用于计算一幅图片的各项特征参数
%   输入是RBG类型的图片，输出纹理8项特征、对称与水平特征参数，用于接下来的分类判断
parameters=zeros(1,10);%用于初始化特征矩阵
%mean=[0.0268 0.0039 4.3108 0.1836 3.9103 1.3321 0.0424 0.0015 3.9159e+006 30.5158];
%std=[0.0492 0.0018 0.4853 0.0588 2.4401 0.9279 0.0055 0.0029 7.2706e+005 30.8144];
%A=imread(picRBG);
A=picRBG;

B=rgb2gray(A);%最优灰度转化
    
C=medfilt2(B);%中值滤波
   
D=histeq(C);%直方图均匀化增强图像
   
[parameters(1,1:8)]=GLCM1(D);%灰度共生举证特征提取V1_

[E]=Sobel(D);%sobel边缘检测

parameters(1,9)=measuresym(E);

thresh=graythresh(E);%自动确定二值化阈值V_5
F=im2bw(E,thresh);%对图像自动二值化V_5

parameters(1,10)=Linecounter(F);

%parameters(1,:)=(parameters(1,:)-mean)./std;%Z规范化

end

