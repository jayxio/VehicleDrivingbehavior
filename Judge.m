function [ yes ] = Judge( pic )
%Judge �����ж�һ��ͼƬ�Ƿ�Ϊ��
%   picΪRBGͼƬ
yes=myNeuralNetworkFunction2((calfeature(pic))');

end

