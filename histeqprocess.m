filename=dir('C:\Users\saddenlar\Desktop\��ҵ���\���ݼ�\cars_bradcut - gray\*.jpg');
%��ô��i���ļ����ļ����Ϳ��Ա�ʾΪ
for i=1:length(filename)
    A=imread(filename(i).name);
    B=histeq(A);
    imwrite(B,filename(i).name)%����ͼ��Ϊ�ļ�
end
%�ļ�����Ϊ��
length(filename)