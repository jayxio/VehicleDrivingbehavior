function [ mapofpp ] = mapofpp( rgbpic,x,y )
%mapofpp 用于绘制检测视频帧在检测窗口扫描下所得的后验概率分布矩阵
%   后验概率分布矩阵是由分类器（多分类也行，只不过就要用多个矩阵
%表示，该函数暂服务于二分类器）对检测窗口扫描图像判断而得的,x与y是检测窗口纵长和横长
[M N Z]=size(rgbpic);
m=M-x;
n=N-y;
mapofpp=zeros(m,n);

for i=1:m
    for j=1:n
        tmppic=imcrop(rgbpic,[j i y x]);
        mapofpp(i,j)=Judge(tmppic);
    end
end

end

