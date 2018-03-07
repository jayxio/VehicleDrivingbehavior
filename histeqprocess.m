filename=dir('C:\Users\saddenlar\Desktop\毕业设计\数据集\cars_bradcut - gray\*.jpg');
%那么第i个文件的文件名就可以表示为
for i=1:length(filename)
    A=imread(filename(i).name);
    B=histeq(A);
    imwrite(B,filename(i).name)%保存图像为文件
end
%文件数量为：
length(filename)