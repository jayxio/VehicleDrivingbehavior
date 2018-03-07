filename=dir('*.jpg');
m=length(filename);
for i=1:m
   i
   B=imread(filename(i).name);
   B=Label(B,position(i,1),position(i,2),position(i,3),position(i,4));figure;
   imshow(B);
   %imwrite(B,filename(i).name)%保存图像为文件覆盖原文件
   
end
