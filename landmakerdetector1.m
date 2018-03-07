

for i=170:20:329
savefile=['picture_',num2str(i),'.jpg'];%['image_0001.jpg'];
RGB=imread(savefile);

%imshow(RGB);%title('RGB');
I=rgb2gray(RGB);
%figure;imshow(I);
[M N]=size(I);
%I=histeq(I);
movement=3*M/5;
I=I(movement:end,:);
%figure;imshow(I);
%title('ԭͼ�ĻҶ�ͼ');
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
h=figure;imshow(RGB),hold on

max_len = 0;
for k = 1:length(lines)
   if abs(lines(k).theta)<60%Ŀ������������ֱ�ߺͳ����ߣ���Ϊ�������ǽ�Ϊ��ֱ��
   xy = [lines(k).point1;lines(k).point2];
   plot(xy(:,1),movement+xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),movement+xy(1,2),'x','LineWidth',2,'Color','yellow');%���е�movement���ڲ�������ƫ��
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

%brandnewsavefile=['brandnewpicture_',num2str(i),'.jpg'];
%saveas(h,brandnewsavefile,'jpg');
%close(figure(gcf));

end
% highlight the longest line segment
%plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','blue');
%button=1;
%while(button==1)
%[x1,y1]=ginput(1);
%plot(x1,y1,'+');
%[x2,y2,button]=ginput(1);
%plot(x2,y2,'+');
%plot([x1 x2],[y1 y2]);
%end