%% Simple version of KLT
% We treat tracked object only as one particle
clear;
clc;
video=vision.VideoFileReader('yi_dron.wmv');
player=vision.VideoPlayer();
for i=1:10
    frame=step(video);
end
img=255*rgb2gray(frame);
figure;
imshow(frame);
region=round(getPosition(imrect));
x1=region(1);
y1=region(2);
x2=region(1)+region(3);
y2=region(2)+region(4);

%% Initialization
dx=[0 0 0;-1 0 1;0 0 0];
dy=[0 -1 0;0 0 0;0 1 0];

%% Tracking
%while(~isDone(video))
steps=15;
dp_array=zeros(2,steps);
for i=1:steps;
    frame=step(video);
    T=img(y1:y2,x1:x2);
    img=255*rgb2gray(frame);
    for k=1:25
        I=img(y1:y2,x1:x2);
        Gx=conv2(img(y1-1:y2+1,x1-1:x2+1),dx,'valid');
        Gy=conv2(img(y1-1:y2+1,x1-1:x2+1),dy,'valid');
        Hxx=Gx.^2;
        Hxx=sum(Hxx(:));
        Hxy=Gx.*Gy;
        Hxy=sum(Hxy(:));
        Hyy=Gy.^2;
        Hyy=sum(Hyy(:));
        diff=T-I;
        diff_Gx=Gx.*diff;
        diff_Gy=Gy.*diff;
        dp=-round([Hxx Hxy;Hxy Hyy]\[sum(diff_Gx(:));sum(diff_Gy(:))]);
        dp_array(:,i)=dp_array(:,i)+dp;
        y1=y1+dp(2);
        y2=y2+dp(2);
        x1=x1+dp(1);
        x2=x2+dp(1);
        region(1)=region(1)+dp(1);
        region(2)=region(2)+dp(2);
        out=insertShape(frame,'Rectangle',region,'Color','red');
    end
    step(player,out);
end
release(video);