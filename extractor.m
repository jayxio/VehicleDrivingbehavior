filename=dir('*.jpg');
m=size(filename);
X=zeros(size(m,1));
for i=1:m
    A=imread(filename(i).name);
    %X(i,1)=Linecounter(A);
    X(i,1)=measuresym(A);
    i
end