%auther:�ܿ���
%%*****��m�ĵ��Ǹ��ִ���ͼƬ���ܵĻ��ܣ����Ǵ�����ǰ�ļ���ͼƬ�����Ǳ����
%%*****����һ��Ҫ����ͼƬ�ĸ��������������мǣ�����
filename=dir('*.jpg');%��ȡ��ǰ�ļ�������jpg��ʽͼƬ
%��ô��i���ļ����ļ����Ϳ��Ա�ʾΪ
m=length(filename);

%X=zeros(m,8);%���ڳ�ʼ���Ҷȹ���������ȡ����V1_

%��brad�ļ������Գ�149����110�ĳߴ�ظ�������ͼ����markus�ļ�����464,362�ĳߴ��ͼV2_

%num=1;%�����ļ�������V3_

%y=ones(m,1);%���ڱ���Ԥ��Ľ��V4_
for i=1:m
    A=imread(filename(i).name);
    %[M N Z]=size(A);%
    %if Z==3%��֤A��ά��
    %B=rgb2gray(A);%���ŻҶ�ת��
    
    %B=medfilt2(A);%��ֵ�˲�
   
    %B=shadelight(A);%ȥ����Ӱ��
    
    %B=histeq(A);%ֱ��ͼ���Ȼ���ǿͼ��
    
    %[X(i,:)]=GLCM1(A);%�Ҷȹ�����֤������ȡV1_
    
    %B=cut(A,x,y,m,n);%������Ӧ���꣬����ͼƬV2_
    %[M N]=size(A);
    %a=floor((M-110)/40);%����ѡ��������ͼƬ�߽�ļ�����㣬����Ҫ���еĴ�С�޸�����
    %b=floor((N-149)/40);%����ѡ��������ͼƬ�߽�ļ�����㣬����Ҫ���еĴ�С�޸�����
    %for j=1:40:a*40
    %   for k=1:40:b*40
    %      B=cut(A,j,k,110,149);%ͬʱҪ�޸Ĵ˴�
    %      savefile=['background_',num2str(num),'.jpg'];
    %      imwrite(B,savefile);
    %      num=num+1;
    %   end
    %end
    
    %[B]=Sobel(A);%sobel��Ե���
    
    %thresh=graythresh(A);%�Զ�ȷ����ֵ����ֵV_5
    %B=im2bw(A,thresh);%��ͼ���Զ���ֵ��V_5
    
    %savefile=['picture_',num2str(i),'.bmp'];%����bmp�����ļ���׺V_5
    %imwrite(B,savefile);%����V_5
    i
    %imwrite(B,filename(i).name)%����ͼ��Ϊ�ļ�����ԭ�ļ�    
    %end%��֤A��ά��Ϊ3���ٽ��лҶȻ�
    
    
end
%[y] = myNeuralNetworkFunction1(X');%yΪ0��ʾ��1��ʾ��V4_