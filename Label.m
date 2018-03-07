function [ labeledpic ] = Label( rgbpic, x,y,m,n )
%Label 根据坐标和纵横长度在一副新图像上画红线
%   x,y,n,m是可以从Findcar函数直接返回得到的参数
labeledpic=double(rgbpic);
a=floor(m/2);
b=floor(n/2);
for i=x-b:x+b
    labeledpic(y-a,i,1)=255;
    labeledpic(y+a,i,1)=255;
    labeledpic(y-a-1,i,1)=255;
    labeledpic(y+a-1,i,1)=255;
end
for i=y-a:y+a
    labeledpic(i,x-b,1)=255;
    labeledpic(i,x+b,1)=255;
    labeledpic(i,x-b-1,1)=255;
    labeledpic(i,x+b-1,1)=255;
end

labeledpic=uint8(labeledpic);

end

