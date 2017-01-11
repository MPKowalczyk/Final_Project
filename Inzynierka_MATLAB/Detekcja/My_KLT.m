%% Detection algorithm test application
% Comparison of tracking algorithms for final project and KKA article.

%% Object initialization
video=vision.VideoFileReader('cam_dron.wmv');
player=vision.VideoPlayer();
%% Tracking
%while(~isDone(video))
for i=1:50
    frame=step(video);
    frame=frame(50:end-50,50:end-50,:);
    frame_gray=rgb2gray(frame);
    frame_bin=(255*frame_gray)<50;
    frame_size=size(frame_bin);
    m00=sum(frame_bin(:));
    m10=sum(frame_bin*(1:frame_size(2))');
    x=floor(m10/m00);
    m01=sum((1:frame_size(1))*frame_bin);
    y=floor(m01/m00);
    frame(y,:,1)=1;
    frame(y,:,2)=0;
    frame(y,:,3)=0;
    frame(:,x,1)=1;
    frame(:,x,2)=0;
    frame(:,x,3)=0;
    step(player,frame);
end
release(player);
release(video);