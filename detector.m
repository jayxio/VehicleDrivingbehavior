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
else
    bool=0;
end

end