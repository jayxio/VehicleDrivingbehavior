function [ labeledpic ] = Label( rgbpic, x,y,m,n )
%Label ����������ݺ᳤����һ����ͼ���ϻ�����
%   x,y,n,m�ǿ��Դ�Findcar����ֱ�ӷ��صõ��Ĳ���
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

