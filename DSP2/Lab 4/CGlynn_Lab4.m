clear;

RGB = imread('Gazebo.jpg'); % Read the image in

%% Code Given in Slides to Correct Histogram

[height, width, color] = size(RGB); % Get the width and height

len = 256;
YCbCr = rgb2ycbcr(RGB); % RGB to YCbCr conversion
Y = double(YCbCr(:,:,1)); % Get Y only

hist = zeros(1,len);

for i=1:height % Compute histogram of image
    for j=1:width
        index = uint8((Y(i,j))+1);
        hist(index) = hist(index) + 1;
    end
end

imageSize = width * height; % Create equalize look up table
eqFactor = 255 / imageSize;
sum = 0;

for i=1:len
    sum = sum + hist(i);
    eqValue = sum * eqFactor;
    
    if eqValue > 255 % Limit upper data
        eqValue = 255;
    end
    
    eqTable(i) = uint8(eqValue);
end

% Image equalization, new Y
for i=1:height 
    for j=1:width
        index = uint8((Y(i,j))+1);
        newY(i,j) = eqTable(index);
    end
end

newYCbCr(:,:,1) = newY;
newYCbCr(:,:,2) = YCbCr(:,:,2);
newYCbCr(:,:,3) = YCbCr(:,:,3);

newRGB = ycbcr2rgb(newYCbCr);

% Compute new image histogram
newHist = zeros(1,len);
for i=1:height 
    for j=1:width
        index = uint8((Y(i,j))+1);
        newHist(index) = newHist(index) + 1;
    end
end

%% Short, Research-Based Way to Brighten the Image
newY2 = imlocalbrighten(RGB);
newY2 = newY2+50;

%% One-Line Histogram Correction Using MATLAB Function
newY3 = histeq(RGB);

%% Plotting Different Image Histograms

figure(1), subplot(4,1,1);
imhist(YCbCr(:,:,1));
title('Original Image');

subplot(4,1,2);
imhist(newY);
title('Provided Code');

subplot(4,1,3);
imhist(newY2);
title('Brightened Image');

subplot(4,1,4);
imhist(newY3);
title('HistEQ Function');

figure(2);
imshow(RGB);
title('Provided Code');

figure(3);
imshow(newY);
title('REVISED MATLAB histeq equalized');

figure(4);
imshow(newY2);
title('Brightened Image');

figure(5);
imshow(newY3);
title('HistEQ Function');

%% Questions

% a) Can you identify structural details of the building?

% In all 3 image corrections I can identify the structural details of
% the building. I am most able to identify the details in the "Brightened"
% image using the 'imlocalbrighten' function and adding brightness to the
% image. 


% b) What problems with histogram correction can you identify?

% Using the provided code, the image lost almost all colour, but you were
% still able to see the outlines of the structure and the general landscape
% behind the gazebo

% Using my limited research, those functions are able to keep the colour,
% almost seeming to saturate the image too much, as the wooden frame of the
% gazebo appears very red, as does the (presumably) night sky. You are able
% to tell that the landscape in the background is trees though. 

% Using HistEQ, colour is also kept, but much less than the prvious
% version. The image appears blown out, the highlights on the frame of the
% gazebo are a bright yellow, which contrasts with the back framing almost
% blending in with the landscape in the background fo the image.

% All three of these mothods leave something to be desire though, as the
% quality of all of the images is extremely grainy, with little detail
% outside of the wooden framing of the gazebo, and the chair underneath it.


% c) How would you make the photo more realistic?

% I would attempt to make the image quality better by saturating the
% image further in spots where it is needed, like the sky, treeline, and
% the immediate foreground coming towards the photgrapher below the gazebo.
% I would try to Colour Balance the image, then perform Gamma Correction,
% and then maybe mess around with the individual RBG values to further
% enhance the colours as needed.