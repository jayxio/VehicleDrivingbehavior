function [ Judgedpic ] = mark( rgbpic,bool )
%mark 用于标记图片，绿色表示合法，红色表示违法
%   bool为0是标记为绿色，否则标记为红色

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

