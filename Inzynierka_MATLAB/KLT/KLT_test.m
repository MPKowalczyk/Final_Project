%% KLT algorithm test application
% Comparison of tracking algorithms for final project and KKA article.

%% Object initialization
video=vision.VideoFileReader('cam_dron.wmv');
player=vision.VideoPlayer();
frame=step(video);
frame_map=rgb2gray(frame);
figure;
imshow(frame);
region=round(getPosition(imrect));
image=insertShape(frame,'Rectangle',region,'Color','red');
imshow(image);
title('Red box shows object region');

%% Tracker initialization
points=detectMinEigenFeatures(frame_map,'ROI',region);
image_points=insertMarker(image,points.Location,'+','Color','white');
imshow(image_points);
title('Detected interest points');
tracker=vision.PointTracker('MaxBidirectionalError',1);
initialize(tracker,points.Location,frame);

%% Tracking
while(~isDone(video))
    frame=step(video);
    [points,validity]=step(tracker,frame);
    if sum(validity>0)
        sr=median(points(validity,:),1);
    end
    if sum(validity)<5
        frame_map=rgb2gray(frame);
        region=[max(sr(1)-25,1),max(sr(2)-25,1),50,50];
        points_new=detectMinEigenFeatures(frame_map,'ROI',region);
        if(~points_new.isempty)
            setPoints(tracker,points_new.Location);
        end
    end
    out=insertMarker(frame,points(validity,:),'+','color','green');
    out=insertMarker(out,sr,'+','color','red');
    step(player,out);
end
release(player);
release(video);