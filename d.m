%作者：熊俊峰

%该程序用于检测并跟踪车辆
%用法：打开目标文件夹为当前目录，运行程序，得到文件夹中每一帧图像的
%车辆检测位置以及窗口大小，以position向量的形式返回[x y m n]分别是横坐标、
%纵坐标、窗口垂直长度和窗口水平长度
filename=dir('*.jpg');
l=length(filename);

%------------------------------------
%初始化卡尔曼滤波所需变量
X=zeros(8,l);%用于存放卡尔曼滤波的每次预测状态向量(最优估计的)，但前两个向量的窗口速度和大小变化率没有X(k)=[x,y,m,n,vx,vy,dm,dn]
XX=zeros(8,l);%用于存放卡尔曼滤波的每次观测下来的状态向量
P1=eye(8);
Q=eye(8);
R=eye(4);
Ak=eye(8);
Ck=eye(4,8);
Ck=[Ck(:,1) Ck(:,2) Ck(:,5) Ck(:,6) Ck(:,3) Ck(:,4) Ck(:,7) Ck(:,8)];
I=ones(8,8);
%------------------------------------

for i=1:l
    A=imread(filename(i).name);
    [M N Z]=size(A);
    if i==1;%第一次检测默认从中心开始
        x=N/2;
        y=M/2;
        m=floor(0.4*M);%纵长
        n=floor(0.35*N);%横长
    end
    [ x y m n ] = Findcar( A,x,y,m,n );
    X(1,i)=x;X(2,i)=y;X(3,i)=m;X(4,i)=n;
    i
    B=Label(A,floor(X(1,i)),floor(X(2,i)),floor(X(3,i)),floor(X(4,i)));
    figure;%可以用X里面的值，position其实不需要
    imshow(B);
end