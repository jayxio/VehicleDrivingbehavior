function [ sym ] = measuresym( sobelpic )
%auther:�ܿ���
%measuresym ����ͼƬ�ĶԳƳ̶�
%   �ر������ھ���sobel���ӱ�Ե�����ͼ�񣬼����ͼ��������Գ���
sym=0;
A=imresize(sobelpic,[250 200]);
[M N]=size(A);
tmppic=double(A);
tmppic1=double(A);
for i=1:M
    for j=1:N/2
        tmp=tmppic(i,j);
        tmppic(i,j)=tmppic(i,N-j);
        tmppic(i,N-j)=tmp;
    end
end         %   tmppic��ͼƬ����˫��ѭ����������ˮƽ��ת��
tmppic1=abs(tmppic1-tmppic);
sym=sum(sum(tmppic1)');