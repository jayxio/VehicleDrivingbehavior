%author: Xiong Junfeng
function [ x y m n counter] = Findcar( rgbpic,x0,y0,m0,n0,counter )
%Findcar 该函数用于在输入彩图中寻找车辆的位置（原理类似贪心算法）,作者：熊俊峰
%   Findcar是从图像中央的窗口开始，向判断车辆存在置信度高的方向(上下左右大小)搜寻，直到置信度不在增加

y=y0;x=x0;


m=m0;
n=n0;


step=8;

step1=[0.1 0.1];%横纵缩放比例


score=zeros(1,12);%每个窗口图像的置信度
max1=0;
max2=0.5;
k=0;flag1=666;flag2=777;


%[M N Z]=size(rgbpic);%M与N先作为初始坐标，之后M与N会不断变化
%m=floor(0.45*M);%纵长
%n=floor(0.4*N);%横长

%while (abs(max1-max2)>0.1||max1<0.05)&&k<4

I=0;k=k+1;k
while I~=1%调整
flag1
tmppic1=imcrop(rgbpic,[x-floor(n/2) y-floor(m/2) n m]);
score(1,1)=Judge(tmppic1);%imshow(tmppic1);
tmppic2=imcrop(rgbpic,[x-floor(n/2) y-floor(m/2)-step/2 n m]);%上
score(1,2)=Judge(tmppic2);%figure;imshow(tmppic2);
tmppic3=imcrop(rgbpic,[x-floor(n/2) y-floor(m/2)+step/2 n m]);%下
score(1,3)=Judge(tmppic3);%figure;imshow(tmppic3);
tmppic4=imcrop(rgbpic,[x-floor(n/2)-step y-floor(m/2) n m]);%左
score(1,4)=Judge(tmppic4);%figure;imshow(tmppic4);
tmppic5=imcrop(rgbpic,[x-floor(n/2)+step y-floor(m/2) n m]);%右
score(1,5)=Judge(tmppic5);%figure;imshow(tmppic5);




tmppic6=imcrop(rgbpic,[x-floor(n/2)-step/2 y-floor(m/2)-step/2 n m]);%左上
score(1,6)=Judge(tmppic6);%figure;imshow(tmppic6);
tmppic7=imcrop(rgbpic,[x-floor(n/2)+step/2 y-floor(m/2)-step/2 n m]);%右上
score(1,7)=Judge(tmppic7);%figure;imshow(tmppic7);
tmppic8=imcrop(rgbpic,[x-floor(n/2)-step/2 y-floor(m/2)+step/2 n m]);%左下
score(1,8)=Judge(tmppic8);%figure;imshow(tmppic8);
tmppic9=imcrop(rgbpic,[x-floor(n/2)+step/2 y-floor(m/2)+step/2 n m]);%右下
score(1,9)=Judge(tmppic9);%figure;imshow(tmppic9);

[Z,I]=max(score(1,1:9),[],2);
if I==1
  
elseif I==2
    y=y-step/2;
elseif I==3
    y=y+step/2;
elseif I==4
    x=x-step;
elseif I==5
    x=x+step;
elseif I==6
    x=x-step/2;y=y-step/2;
elseif I==7
    x=x+step/2;y=y-step/2;
elseif I==8
    x=x-step/2;y=y+step/2;
elseif I==9
    x=x+step/2;y=y+step/2;
end
max1=max(score(1,1:9));
end


%if n<50||y+m/2>200%检测窗口重新回到中央，大小恢复默认
%    [M N Z]=size(rgbpic);
%    x=N/2;
%    y=4*M/5;
%    m=floor(0.35*M);%纵长
%    n=floor(0.3*N);%横长
%end
%counter=0;
I=0;
%count=0;%用于统计检测窗口缩小的次数

while I~=10&&counter<=1


flag2
tmppic10=imcrop(rgbpic,[x-floor(n/2) y-floor(m/2) n m]);%原样
score(1,10)=Judge(tmppic10);%figure;imshow(tmppic10);
tmppic11=imcrop(rgbpic,[x-floor(n*(1+step1(1))/2) y-floor(m*(1+step1(2))/2) n*(1+step1(1)) m*(1+step1(2))]);%放大
score(1,11)=Judge(tmppic11);%figure;imshow(tmppic11);
tmppic12=imcrop(rgbpic,[x-floor(n*(1-step1(1))/2) y-floor(m*(1-step1(2))/2) n*(1-step1(1)) m*(1-step1(2))]);%缩小
score(1,12)=Judge(tmppic12);%figure;imshow(tmppic12);

[Z,I]=max(score(1,10:12),[],2);
I=I+9;
if I==10

elseif I==11&&counter>-2
    n=n*(1+step1(1));m=m*(1+step1(2));
    counter=counter-1;%只能放大n次
elseif I==12&&counter<2
    n=n*(1-step1(1));m=m*(1-step1(2));
    counter=counter+1;%只能缩小n次
end

max2=max(score(1,10:12));


end
%end


end

