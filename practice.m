%{
filename=dir('*.m');
l=length(filename);
%}
%{
        1
       222
      33333
     4448444
    555555555
   66666666666
  7777777777777
 888888888888888
99999999999999999
%}
for i=1:9
    for j=1:9-i
        fprintf('\t');
    end
    s='';
    tmp=num2str(i);
    for k=1:2*i-1
        s=strcat(s,tmp);
    end
    fprintf('%s',s);
    fprintf('\r');
end

