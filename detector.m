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
else
    bool=0;
end

end