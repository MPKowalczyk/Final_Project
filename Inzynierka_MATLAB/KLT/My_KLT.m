%% KLT algorithm test application
% Comparison of tracking algorithms for final project and KKA article.

%% Object initialization
video=vision.VideoFileReader('cam_dron.wmv');
player=vision.VideoPlayer();
frame=step(video);
%frame_map=rgb2gray(frame);
%figure;
%imshow(frame);
%region=round(getPosition(imrect));
%image=insertShape(frame,'Rectangle',region,'Color','red');
%imshow(image);
%title('Red box shows object region');

%% Initialization
mx=[0 0 0 0 0;0 0 0 0 0;0 -1 0 1 0;0 0 0 0 0;0 0 0 0 0];
my=[0 0 0 0 0;0 0 -1 0 0;0 0 0 0 0;0 0 1 0 0;0 0 0 0 0];
mxx=[0 0 0 0 0;0 0 0 0 0;1 0 -2 0 1;0 0 0 0 0;0 0 0 0 0];
mxy=[0 0 0 0 0;0 1 0 -1 0;0 0 0 0 0;0 -1 0 1 0;0 0 0 0 0];
myy=[0 0 1 0 0;0 0 0 0 0;0 0 -2 0 0;0 0 0 0 0;0 0 1 0 0];
box=5;
h_H=712;
w_H=1272;
%G=cell(h_H,w_H);
%H=cell(h_H,w_H);
%E=cell(h_H,w_H);
%G_shift=floor(box/2);
eig_thr=zeros(h_H,w_H);
lambda_thr=0.3;

%% Tracking
while(~isDone(video))
    frame=step(video);
    frame_map=rgb2gray(frame);
    Gx=conv2(frame_map,mx,'valid');
    Gy=conv2(frame_map,my,'valid');
    Hxx=conv2(frame_map,mxx,'valid');
    Hxy=conv2(frame_map,mxy,'valid');
    Hyy=conv2(frame_map,myy,'valid');
    Hxx_sum=conv2(Hxx,ones(box),'valid');
    Hxy_sum=conv2(Hxy,ones(box),'valid');
    Hyy_sum=conv2(Hyy,ones(box),'valid');
    delta=(Hxx_sum-Hyy_sum).^2+4*Hxy_sum.^2;
    lambda1=(Hxx_sum+Hyy_sum+sqrt(delta))/2;
    lambda2=(Hxx_sum+Hyy_sum-sqrt(delta))/2;
    eig_thr=abs(lambda1)>lambda_thr & abs(lambda2)>lambda_thr;
    %{
    for i=1:h_H
        for k=1:w_H
            G{i,k}=[Gx(i+G_shift,k+G_shift);Gy(i+G_shift,k+G_shift)];
            H{i,k}=[Hxx_sum(i,k) Hxy_sum(i,k);Hxy_sum(i,k) Hyy_sum(i,k)];
            E{i,k}=eig(H{i,k});
            eig_thr(i,k)=all(E{i,k}>1);
        end
    end
    %}
    step(player,eig_thr);
end
release(player);
release(video);