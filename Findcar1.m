function [ x y m n ] = Findcar1( rgbpic,x0,y0,m0,n0 )
%Findcar �ú��������������ͼ��Ѱ�ҳ�����λ�ã�ԭ������̰���㷨��,���ߣ��ܿ���
%   Findcar�Ǵ�ͼ������Ĵ��ڿ�ʼ�����жϳ����������Ŷȸߵķ���(�������Ҵ�С)��Ѱ��ֱ�����ŶȲ�������

y=y0;x=x0;


m=m0;
n=n0;

step=20;%����ƽ�ƴ��ڵľ���
step1=[10 10];%�������Ų���
score=zeros(1,8);%ÿ������ͼ������Ŷ�
max1=0;
max2=1;


%[M N Z]=size(rgbpic);%M��N����Ϊ��ʼ���֮꣬��M��N�᲻�ϱ仯
%m=floor(0.45*M);%�ݳ�
%n=floor(0.4*N);%�᳤

while abs(max1-max2)>0.06
I=0;
while I~=1%����
tmppic1=imcrop(rgbpic,[x-n/2 y-m/2 n m]);
score(1,1)=Judge(tmppic1);score(1,6)=score(1,1);
tmppic2=imcrop(rgbpic,[x-n/2 y-m/2-step n m]);%��
score(1,2)=Judge(tmppic2);
tmppic3=imcrop(rgbpic,[x-n/2 y-m/2+step n m]);%��
score(1,3)=Judge(tmppic3);
tmppic4=imcrop(rgbpic,[x-n/2-step y-m/2 n m]);%��
score(1,4)=Judge(tmppic4);
tmppic5=imcrop(rgbpic,[x-n/2+step y-m/2 n m]);%��
score(1,5)=Judge(tmppic5);

[Z,I]=max(score(1,1:5),[],2);
if I==1
    %figure;imshow(tmppic1);
elseif I==2
    y=y-step;%figure;imshow(tmppic2);
elseif I==3
    y=y+step;%figure;imshow(tmppic3);
elseif I==4
    x=x-step;%figure;imshow(tmppic4);
elseif I==5
    x=x+step;%figure;imshow(tmppic5);
end
max1=max(score(1,1:5));
end


if max1<0.1||n<50||y+m/2>200%��ⴰ�����»ص����룬��С�ָ�Ĭ��
    [M N Z]=size(rgbpic);
    x=N/2;
    y=M/2;
    m=floor(0.35*M);%�ݳ�
    n=floor(0.3*N);%�᳤
end

I=0;
count=0;%����ͳ�Ƽ�ⴰ����С�Ĵ���
while I~=6
tmppic7=imcrop(rgbpic,[x-n/2-step1(1) y-m/2-step1(2) n+2*step1(1) m+2*step1(2)]);%�Ŵ�
score(1,7)=Judge(tmppic7);
tmppic8=imcrop(rgbpic,[x-n/2+step1(1) y-m/2+step1(2) n-2*step1(1) m-2*step1(2)]);%��С
score(1,8)=Judge(tmppic8);

[Z,I]=max(score(1,6:8),[],2);
I=I+5;
if I==6
   %figure;imshow(tmppic1);%���ǳ�ʼ��С
elseif I==7
    n=n+2*step1(1);m=m+2*step1(2);%figure;imshow(tmppic7);%��
elseif I==8
    n=n-2*step1(1);m=m-2*step1(2);%figure;imshow(tmppic8);%С
    
end
max2=max(score(1,6:8));
end
end


end

