for i=413:526
A=imread(filename(i).name);tmp=imcrop(A);

savefile=['picture_',num2str(i),'.jpg'];%����bmp�����ļ���׺V_5
imwrite(tmp,savefile);%����V_5
end
