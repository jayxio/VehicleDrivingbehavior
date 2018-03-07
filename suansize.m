filename=dir('*.jpg');
%那么第i个文件的文件名就可以表示为
sum1=0;
sum2=0;
for i=1:length(filename)
    A=imread(filename(i).name);
    [m n]=size(A);
    sum1=sum1+m;
    sum2=sum2+n;
end
%平均长款为：
m=sum1/length(filename)
n=sum2/length(filename)
