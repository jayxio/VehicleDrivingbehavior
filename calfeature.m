function [ parameters ] = calfeature( picRBG )
%calfeature ���ڼ���һ��ͼƬ�ĸ�����������
%   ������RBG���͵�ͼƬ���������8���������Գ���ˮƽ�������������ڽ������ķ����ж�
parameters=zeros(1,10);%���ڳ�ʼ����������
%mean=[0.0268 0.0039 4.3108 0.1836 3.9103 1.3321 0.0424 0.0015 3.9159e+006 30.5158];
%std=[0.0492 0.0018 0.4853 0.0588 2.4401 0.9279 0.0055 0.0029 7.2706e+005 30.8144];
%A=imread(picRBG);
A=picRBG;

B=rgb2gray(A);%���ŻҶ�ת��
    
C=medfilt2(B);%��ֵ�˲�
   
D=histeq(C);%ֱ��ͼ���Ȼ���ǿͼ��
   
[parameters(1,1:8)]=GLCM1(D);%�Ҷȹ�����֤������ȡV1_

[E]=Sobel(D);%sobel��Ե���

parameters(1,9)=measuresym(E);

thresh=graythresh(E);%�Զ�ȷ����ֵ����ֵV_5
F=im2bw(E,thresh);%��ͼ���Զ���ֵ��V_5

parameters(1,10)=Linecounter(F);

%parameters(1,:)=(parameters(1,:)-mean)./std;%Z�淶��

end

