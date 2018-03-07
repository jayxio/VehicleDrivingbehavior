%作者：熊俊峰  四川成都高新区盛邦街  2016年8月1号

%该程序用于检测并跟踪车辆
%用法：打开目标文件夹为当前目录，运行程序，得到文件夹中每一帧图像的
%车辆检测位置以及窗口大小，以position向量的形式返回[x y m n]分别是横坐标、
%纵坐标、窗口垂直长度和窗口水平长度

filename=dir('*.jpg');
l=length(filename);

%------------------------------------
%初始化卡尔曼滤波所需变量
%{
X=zeros(8,l);%用于存放卡尔曼滤波的每次预测状态向量(最优估计的)，但前两个向量的窗口速度和大小变化率没有X(k)=[x,y,m,n,vx,vy,dm,dn]
XX=zeros(8,l);%用于存放卡尔曼滤波的每次观测下来的状态向量
P1=eye(8);
Q=eye(8);
R=eye(8);
Ak=eye(8);
Ck=eye(8);
%}
%------------------------------------
Judgement=0;%0表示没有违规，1表示违规
%------------------------------------车辆目标追踪
for i=1:l
    %savefile=['image_',num2str(i),'.jpg'];%['image_0001.jpg'];
    %A=imread(savefile);
    A=imread(filename(i).name);
    if i==1;%在检测第一帧是设定初始值 
        [M N Z]=size(A);
        
        %x=N/2;
        %y=M/2;
        %m=floor(0.35*M);%纵长
        %n=floor(0.3*N);%横长
        %183.5000  128.5000  151.0000  110.0000
        %236.5 143.5 173 119
        %182.5 145.5 191 156
        x=279;%400;
        y=215;%380;
        m=119;%100;%纵长
        n=173;%130;%横长    用于手动选择初始目标，再跟踪（全自动检测情况下是设定几个固定的窗口，通常设定在经常有车辆出现的位置）
        lineareqlast=500*ones(4,2);%放500的意思是说不存在直线方程
        lineareqthis=500*ones(4,2);%这是用于存放车道线方程的矩阵，可以存放4个直线方程，lineareq。。。（：,1）是theta，lineareq。。。（:,2）是rho
    end
    
    if mod(i,12)==0
        counter=0;
    else
        counter=5;
    end   %这个模块很重要，规定了窗口大小检测的频率，频繁太高的窗口大小改变容易让车辆目标跟踪发生漂移，频率太低的窗口大...
          %小改变会跟不上目标大小变化也会造成跟踪漂移，因此限制窗口大小检测频率至关重要
    %-----------------------------------------------------------------判断跟踪是
    %否结束，对于违法变道检测来说都是对于一次跟踪来说的
    tmppic=imcrop(A,[x-floor(n/2) y-floor(m/2) n m]);
    if Judge(tmppic)>0.01%0.01以上就说明有车（根据经验来说）
        [ x y m n counter] = Findcar( A,x,y,m,n,counter );
    else
        %重置窗口回原位置
        x=N/2;
        y=2*M/3;
        m=floor(0.35*M);%纵长
        n=floor(0.25*N);%横长
    end
    %-----------------------------------------------------------------
    %x=floor(x);
    %y=floor(y);

    %取前两次的直接检测结果作为最优解，之后再此基础上开始卡尔曼滤波预测
    %{
    if i==1
        X(:,1)=[x,y,m,n,0,0,0,0];XX(:,1)=X(:,1);
    end
    if i==2
        X(:,2)=[x,y,m,n,x-X(1,1),y-X(2,1),m-X(3,1),n-X(4,1)];
        XX(:,2)=X(:,2);
    end
    %--------------------------------------------
    %卡尔曼滤波预测下一帧的起始检测窗口位置与大小,在第三帧开始
    if i>=3
        %预测---------------------------------
        P2=P1+Q;
        XX(:,i)=[x,y,m,n,x-X(1,i-1),y-X(2,i-1),m-X(3,i-1),n-X(4,i-1)];%先记录下观测的向量
        %特此说明：由于假定车辆在视频帧中是匀速直线运动的，状态转移矩阵Ak为单位矩阵，所以X矩阵直接作为预测矩阵,而不用写状态转移方程，直接
        %作为预测结果
        %-------------------------------------
        
        %更新----------------------------------
        Z=Ck*XX(:,i);%由当前观测的状态向量得到观测向量Z，Z中的元素叫做‘实际观测到的’，我也不是特别懂
        y=Z-Ck*X(:,i-1)%测量余量，measurement residual
        S=Ck*P2*Ck'+R;%测量余量协方差
        K=P2*Ck'/(S)%最优卡尔曼增益
        X(:,i)=XX(:,i)+K*y;%更新的最优估计的状态向量
        P1=P2-K*Ck*P2;%更新的协方差估计
        %---------------------------------------
        x=X(1,i);
        y=X(2,i);
        m=X(3,i);
        n=X(4,i);
    %--------------------------------------------
    end
    %}
    
%--------------------------------------------------车道线检测
%imshow(RGB);%title('RGB');
I=rgb2gray(A);
%figure;imshow(I);
[M N]=size(I);
%I=histeq(I);
movement=3*M/5;
I=I(movement:end,:);
%figure;imshow(I);
%title('原图的灰度图');
BW=edge(I,'sobel',0.09);
%figure;imshow(BW);
[H,T,R] = hough(BW);
%figure;imshow(H,[],'XData',T,'YData',R,...
%            'InitialMagnification','fit');
%xlabel('\theta'), ylabel('\rho');
%axis on, axis normal, hold on;
P  = houghpeaks(H,20,'threshold',ceil(0.3*max(H(:))));%
%x = T(P(:,2)); y = R(P(:,1));
%plot(x,y,'s','color','white');
% Find lines and plot them
lines = houghlines(BW,T,R,P);%,'FillGap',5,'MinLength',7
%--------------------------------------------------违法判断
%{
numoflane=0;%用于数存入的车道线方程，所以每次置零
for k = 1:length(lines)
   if abs(lines(k).theta)<60&&numoflane<=3%目的是区分其他直线和车道线，因为车道线是较为竖直的
       lineareqthis(numoflane,1)=lines(k).theta;
       lineareqthis(numoflane,2)=lines(k).rho;
       numoflane=numoflane+1;
   end
   if numoflane<=2
       for z=numoflane:3
           lineareqthis(numoflane,1)=500;
           lineareqthis(numoflane,2)=500;%若没装满则补回500以代表不存在直线方程
       end
   end
end
match=zeros(4,1);

for z=1:4
    lineareqthis
end
%}

%lineareqlast=lineareqthis;
%[Z,I]=min(a,[],2)
%--------------------------------------------------画出来
    i
    B=Label(A,x,y,m,n);
    h=figure;imshow(B);hold on

max_len = 0;
for k = 1:length(lines)
   if abs(lines(k).theta)<60%目的是区分其他直线和车道线，因为车道线是较为竖直的
       
   xy = [lines(k).point1;lines(k).point2];
   plot(xy(:,1),movement+xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),movement+xy(1,2),'x','LineWidth',2,'Color','yellow');%其中的movement用于补偿坐标偏移
   plot(xy(2,1),movement+xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   %if ( len > max_len)
   %   max_len = len;
   %   xy_long = xy;
   %end
   end
end


    hold off
    
    %{
    for k = 1:length(lines)
    if abs(lines(k).theta)<60%目的是区分其他直线和车道线，因为车道线是较为竖直的
    xy = [lines(k).point1;lines(k).point2];
    plot(xy(:,1),movement+xy(:,2),'LineWidth',2,'Color','green');

    % Plot beginnings and ends of lines
    plot(xy(1,1),movement+xy(1,2),'x','LineWidth',2,'Color','yellow');%其中的movement用于补偿坐标偏移
    plot(xy(2,1),movement+xy(2,2),'x','LineWidth',2,'Color','red');

    % Determine the endpoints of the longest line segment
    len = norm(lines(k).point1 - lines(k).point2);
    
    end
    end
    %}
     
    newsavefile=['newpicture_',num2str(i),'.jpg'];
    saveas(h,newsavefile,'jpg');
    close(figure(gcf));
    
    %B=Label(A,floor(X(1,i)),floor(X(2,i)),floor(X(3,i)),floor(X(4,i)));%可以用X里面的值，position其实不需要
    
    %imwrite(B,filename(i).name)%保存图像为文件覆盖原文件
end