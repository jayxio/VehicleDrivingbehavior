function [ yes ] = Judge( pic )
%Judge 用于判断一幅图片是否为车
%   pic为RBG图片
yes=myNeuralNetworkFunction2((calfeature(pic))');

end

