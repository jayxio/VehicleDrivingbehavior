filename=dir('*.jpg');
%��ô��i���ļ����ļ����Ϳ��Ա�ʾΪ
sum1=0;
sum2=0;
for i=1:length(filename)
    A=imread(filename(i).name);
    [m n]=size(A);
    sum1=sum1+m;
    sum2=sum2+n;
end
%ƽ������Ϊ��
m=sum1/length(filename)
n=sum2/length(filename)
