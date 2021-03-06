img=imread('test.png');
img=rgb2gray(img);
dx=[0 0 0;-1 0 1;0 0 0];
dy=[0 -1 0;0 0 0;0 1 0];
Gx=conv2(single(img),dx,'valid');
Gy=conv2(single(img),dy,'valid');
Hxx=Gx.^2;
Hxy=Gx.*Gy;
Hyy=Gy.^2;
gauss=[1 2 1;2 4 2;1 2 1]/16;
Hxx=conv2(Hxx,gauss,'valid');
Hxy=conv2(Hxy,gauss,'valid');
Hyy=conv2(Hyy,gauss,'valid');
metric=((Hxx+Hyy)-sqrt((Hxx-Hyy).^2+4*Hxy.^2))/2;
imshow(metric);
