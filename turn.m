function [ turnedpic ] = turn( sobelpic )
%auther:�ܿ���
%measuresym ����ͼƬ�ĶԳƳ̶�
%   �ر������ھ���sobel���ӱ�Ե�����ͼ�񣬼����ͼ��������Գ���

A=sobelpic;
[M N]=size(A);
turnedpic=double(A);

for i=1:M
    for j=1:N/2
        tmp=turnedpic(i,j);
        turnedpic(i,j)=turnedpic(i,N-j);
        turnedpic(i,N-j)=tmp;
    end
end         %   tmppic��ͼƬ����˫��ѭ����������ˮƽ��ת��
turnedpic=uint8(turnedpic);