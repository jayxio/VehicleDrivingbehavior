for i=413:526
A=imread(filename(i).name);tmp=imcrop(A);

savefile=['picture_',num2str(i),'.jpg'];%生成bmp类型文件后缀V_5
imwrite(tmp,savefile);%保存V_5
end
