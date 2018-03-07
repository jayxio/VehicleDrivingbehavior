function [ numofline ] = Linecounter( Binarizedpic0 )
%auther: 熊俊峰
%Linecounter 统计一副二值图片中连续水平线条的数量和质量
%          （水平边缘的长度每超过五分之一窗口宽度就使得numofline加一）
%   当然，对输入图像的数字矩阵进行转置就可以统计原图像的连续垂直线条的数量
Binarizedpic=imresize(Binarizedpic0,[250 200]);%大小归一化
[M N]=size(Binarizedpic);
numofline=0;
thresh=N/5;%这个阈值可改变水平边缘质量的评价标准，值越大标准越严格，最大为N-1;
counter=0;%用来统计每次检测的水平边缘的像素长度，每个水平边缘统计完了之后归零
for i=1:M-1
    for j=1:N-1
        fourpixels=[Binarizedpic(i,j) Binarizedpic(i,j+1);...
            Binarizedpic(i+1,j) Binarizedpic(i+1,j+1)];
        if detector(fourpixels)
            counter=0;
        else
            counter=counter+1;
        end
        if counter>=thresh
            numofline=numofline+1;
            counter=0;
        end
    end
    counter=0;
end

end

function [ bool ] = detector( fourpixels )
%detector 是一个用于Linecounter函数内部的函数，用于判断水平边缘是否结束
%         如果是结束的情况，bool返回1
if fourpixels(1,1)==1&&fourpixels(1,2)==0&&fourpixels(2,1)==0
    bool=1;
elseif fourpixels(2,1)==1&&fourpixels(1,1)==0&&fourpixels(2,2)==0
    bool=1;
elseif fourpixels(1,1)==1&&fourpixels(2,1)==1&&fourpixels(1,2)==0&&...
        fourpixels(2,2)==0%读者你可以去分析为什么是这三种情况标志着水平边缘的结束
    bool=1;
elseif fourpixels(1,1)==0&&fourpixels(1,2)==0&&fourpixels(2,1)==0&&...
       fourpixels(2,2)==0%当都是黑色是就根本不开始
    bool=1;
else
    bool=0;
end

end