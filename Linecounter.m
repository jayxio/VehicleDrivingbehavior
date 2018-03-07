function [ numofline ] = Linecounter( Binarizedpic0 )
%auther: �ܿ���
%Linecounter ͳ��һ����ֵͼƬ������ˮƽ����������������
%          ��ˮƽ��Ե�ĳ���ÿ�������֮һ���ڿ�Ⱦ�ʹ��numofline��һ��
%   ��Ȼ��������ͼ������־������ת�þͿ���ͳ��ԭͼ���������ֱ����������
Binarizedpic=imresize(Binarizedpic0,[250 200]);%��С��һ��
[M N]=size(Binarizedpic);
numofline=0;
thresh=N/5;%�����ֵ�ɸı�ˮƽ��Ե���������۱�׼��ֵԽ���׼Խ�ϸ����ΪN-1;
counter=0;%����ͳ��ÿ�μ���ˮƽ��Ե�����س��ȣ�ÿ��ˮƽ��Եͳ������֮�����
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
%detector ��һ������Linecounter�����ڲ��ĺ����������ж�ˮƽ��Ե�Ƿ����
%         ����ǽ����������bool����1
if fourpixels(1,1)==1&&fourpixels(1,2)==0&&fourpixels(2,1)==0
    bool=1;
elseif fourpixels(2,1)==1&&fourpixels(1,1)==0&&fourpixels(2,2)==0
    bool=1;
elseif fourpixels(1,1)==1&&fourpixels(2,1)==1&&fourpixels(1,2)==0&&...
        fourpixels(2,2)==0%���������ȥ����Ϊʲô�������������־��ˮƽ��Ե�Ľ���
    bool=1;
elseif fourpixels(1,1)==0&&fourpixels(1,2)==0&&fourpixels(2,1)==0&&...
       fourpixels(2,2)==0%�����Ǻ�ɫ�Ǿ͸�������ʼ
    bool=1;
else
    bool=0;
end

end