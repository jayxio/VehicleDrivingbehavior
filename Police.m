function [ bool ] = Police( theta1,rho1,theta2,rho2,x,y,movement)
%Police �����ж��Ƿ�Υ��
%   �����������������ߵķ��̺͵�ǰ�����ĳ���λ�����꣬���Խ�磬�ж�ΪΥ��

%���ڼ�����ͼƬ�´�벿�֣�������Ҫ�ֲ����ƽ��ƫ�������£�
if y>=-(cos(theta2/180*pi)/sin(theta2/180*pi))*x+rho2/sin(theta2/180*pi)+movement&&y>=-(cos(theta1/180*pi)/sin(theta1/180*pi))*x+rho1/sin(theta1/180*pi)+movement
    bool=0;%��λ�����������ߵ��м䣬��ô��û��Υ��
else
    bool=1;%һ��׷��Ŀ������곬Խ�˳����߷��̣��ж�ΪΥ��
end
end

