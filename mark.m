function [ Judgedpic ] = mark( rgbpic,bool )
%mark ���ڱ��ͼƬ����ɫ��ʾ�Ϸ�����ɫ��ʾΥ��
%   boolΪ0�Ǳ��Ϊ��ɫ��������Ϊ��ɫ

A=double(rgbpic);
if bool==0
    for i=50:100
       for j=800:850
    
       A(i,j,2)=255;
    
       end
    end
else
    for i=50:100
       for j=800:850
    
       A(i,j,1)=255;
    
       end
    end
end
Judgedpic=uint8(A);

end

