%auther:熊俊峰
%%*****该m文档是各种处理图片功能的汇总，都是处理当前文件夹图片并覆盖保存的
%%*****所以一定要留有图片的副本！！！！！切记！！！
filename=dir('*.jpg');%读取当前文件夹所有jpg格式图片
%那么第i个文件的文件名就可以表示为
m=length(filename);

%X=zeros(m,8);%用于初始化灰度共生矩阵提取功能V1_

%在brad文件夹中以长149，宽110的尺寸截负样本的图；在markus文件夹中464,362的尺寸截图V2_

%num=1;%用于文件保存编号V3_

%y=ones(m,1);%用于保存预测的结果V4_
for i=1:m
    A=imread(filename(i).name);
    %[M N Z]=size(A);%
    %if Z==3%保证A的维度
    %B=rgb2gray(A);%最优灰度转化
    
    %B=medfilt2(A);%中值滤波
   
    %B=shadelight(A);%去光照影响
    
    %B=histeq(A);%直方图均匀化增强图像
    
    %[X(i,:)]=GLCM1(A);%灰度共生举证特征提取V1_
    
    %B=cut(A,x,y,m,n);%输入相应坐标，剪切图片V2_
    %[M N]=size(A);
    %a=floor((M-110)/40);%用于选出不超过图片边界的剪切起点，根据要剪切的大小修改数字
    %b=floor((N-149)/40);%用于选出不超过图片边界的剪切起点，根据要剪切的大小修改数字
    %for j=1:40:a*40
    %   for k=1:40:b*40
    %      B=cut(A,j,k,110,149);%同时要修改此处
    %      savefile=['background_',num2str(num),'.jpg'];
    %      imwrite(B,savefile);
    %      num=num+1;
    %   end
    %end
    
    %[B]=Sobel(A);%sobel边缘检测
    
    %thresh=graythresh(A);%自动确定二值化阈值V_5
    %B=im2bw(A,thresh);%对图像自动二值化V_5
    
    %savefile=['picture_',num2str(i),'.bmp'];%生成bmp类型文件后缀V_5
    %imwrite(B,savefile);%保存V_5
    i
    %imwrite(B,filename(i).name)%保存图像为文件覆盖原文件    
    %end%保证A的维度为3，再进行灰度化
    
    
end
%[y] = myNeuralNetworkFunction1(X');%y为0表示否，1表示是V4_
