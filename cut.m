%**�˺������ڼ��лҶ�ͼ��
function Newpic= cut(Gray,x,y,m,n)%x��y��Ҫ����ͼ������Ͻ�λ�ã�mΪ����nΪ��
tmp=double(Gray);
[M N]=size(tmp);
Newpic=ones(m,n);
for i=x:x+m-1
    for j=y:y+n-1
       Newpic(i-x+1,j-y+1)=tmp(i,j); 
    end
end
Newpic=uint8(Newpic);
