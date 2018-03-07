function [ x y m n ] = Findcar1( rgbpic,x0,y0,m0,n0 )
%Findcar 该函数用于在输入彩图中寻找车辆的位置（原理类似贪心算法）,作者：熊俊峰
%   Findcar是从图像中央的窗口开始，向判断车辆存在置信度高的方向(上下左右大小)搜寻，直到置信度不在增加

y=y0;x=x0;


m=m0;
n=n0;

step=20;%横纵平移窗口的距离
step1=[10 10];%横纵缩放步长
score=zeros(1,8);%每个窗口图像的置信度
max1=0;
max2=1;


%[M N Z]=size(rgbpic);%M与N先作为初始坐标，之后M与N会不断变化
%m=floor(0.45*M);%纵长
%n=floor(0.4*N);%横长

while abs(max1-max2)>0.06
I=0;
while I~=1%调整
tmppic1=imcrop(rgbpic,[x-n/2 y-m/2 n m]);
score(1,1)=Judge(tmppic1);score(1,6)=score(1,1);
tmppic2=imcrop(rgbpic,[x-n/2 y-m/2-step n m]);%上
score(1,2)=Judge(tmppic2);
tmppic3=imcrop(rgbpic,[x-n/2 y-m/2+step n m]);%下
score(1,3)=Judge(tmppic3);
tmppic4=imcrop(rgbpic,[x-n/2-step y-m/2 n m]);%左
score(1,4)=Judge(tmppic4);
tmppic5=imcrop(rgbpic,[x-n/2+step y-m/2 n m]);%右
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


if max1<0.1||n<50||y+m/2>200%检测窗口重新回到中央，大小恢复默认
    [M N Z]=size(rgbpic);
    x=N/2;
    y=M/2;
    m=floor(0.35*M);%纵长
    n=floor(0.3*N);%横长
end

I=0;
count=0;%用于统计检测窗口缩小的次数
while I~=6
tmppic7=imcrop(rgbpic,[x-n/2-step1(1) y-m/2-step1(2) n+2*step1(1) m+2*step1(2)]);%放大
score(1,7)=Judge(tmppic7);
tmppic8=imcrop(rgbpic,[x-n/2+step1(1) y-m/2+step1(2) n-2*step1(1) m-2*step1(2)]);%缩小
score(1,8)=Judge(tmppic8);

[Z,I]=max(score(1,6:8),[],2);
I=I+5;
if I==6
   %figure;imshow(tmppic1);%就是初始大小
elseif I==7
    n=n+2*step1(1);m=m+2*step1(2);%figure;imshow(tmppic7);%大
elseif I==8
    n=n-2*step1(1);m=m-2*step1(2);%figure;imshow(tmppic8);%小
    
end
max2=max(score(1,6:8));
end
end


end

