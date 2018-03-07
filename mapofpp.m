function [ mapofpp ] = mapofpp( rgbpic,x,y )
%mapofpp ���ڻ��Ƽ����Ƶ֡�ڼ�ⴰ��ɨ�������õĺ�����ʷֲ�����
%   ������ʷֲ��������ɷ������������Ҳ�У�ֻ������Ҫ�ö������
%��ʾ���ú����ݷ����ڶ����������Լ�ⴰ��ɨ��ͼ���ж϶��õ�,x��y�Ǽ�ⴰ���ݳ��ͺ᳤
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

