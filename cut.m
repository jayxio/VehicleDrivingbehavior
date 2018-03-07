%**此函数用于剪切灰度图像
function Newpic= cut(Gray,x,y,m,n)%x与y是要剪切图像的左上角位置，m为长，n为宽
tmp=double(Gray);
[M N]=size(tmp);
Newpic=ones(m,n);
for i=x:x+m-1
    for j=y:y+n-1
       Newpic(i-x+1,j-y+1)=tmp(i,j); 
    end
end
Newpic=uint8(Newpic);
