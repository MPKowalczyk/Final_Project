%% CAMShift algorithm test application
% Comparison of tracking algorithms for final project and KKA article.

%% Object initialization
video=vision.VideoFileReader('Ball.avi');
player=vision.VideoPlayer();
shape=vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[1 0 0]);
frame=step(video);
frame_map=rgb2gray(frame);
figure;
imshow(frame);
region=round(getPosition(imrect));
image=step(shape,frame,region);
imshow(image);
title('Red box shows object region');

%% Tracker initialization
tracker=vision.HistogramBasedTracker;
initializeObject(tracker,frame_map,region);

%% Tracking
while(~isDone(video))
    frame=step(video);
    frame_map=rgb2gray(frame);
    box=step(tracker,frame_map);
    out=step(shape,frame,box);
    step(player,out);
end
release(player);
release(video);