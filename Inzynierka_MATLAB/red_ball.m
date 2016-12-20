img=imread('red-ball1.jpg');
%%
img_ch=rgb2hsv(img);
figure;
contour(img_ch(:,:,1));
figure;
contour(img_ch(:,:,2));
figure;
contour(img_ch(:,:,3));
%%
[X,Y]=meshgrid(1:640,1:560);
figure;
mesh(X,Y,img_ch(:,:,1));
figure;
mesh(X,Y,img_ch(:,:,2));
figure;
mesh(X,Y,img_ch(:,:,3));