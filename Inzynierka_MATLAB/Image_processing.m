ball=imread('red-ball1.jpg');
coefR=fi(0.2126,0,12,12);
coefG=fi(0.7152,0,12,12);
coefB=fi(0.0722,0,12,12);
grey=uint8(coefR*ball(:,:,1)+coefG*ball(:,:,2)+coefB*ball(:,:,3));
imshow(grey);