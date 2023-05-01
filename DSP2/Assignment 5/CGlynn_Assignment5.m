clear;

img = imread('Cat.jpg');

[imHeight, imWidth, color] = size(img); % Get the width and height

%% Filters List

% High-Pass Filters
highpass3 = [-1  -4 -1;
             -4  26 -4;
             -1  -4 -1]/6; 

highpass5 = [0 -1 -1 -1  0;
            -1 -2  4 -2 -1;
            -1  4 13  4 -1;
            -1 -2  4 -2 -1;
             0 -1 -1 -1  0]/9;

highpass7 = [0 -1 -1 -1 -1 -1  0; 
            -1 -1 -2 -2 -2 -1 -1;
            -1 -2 -6 13 -6 -2 -1;
            -1 -2 13 32 13 -2 -1;
            -1 -2 -6 13 -6 -2 -1;
            -1 -1 -2 -2 -2 -1 -1
             0 -1 -1 -1 -1 -1  0]/12;

% Delta Filters
delta3 = [0  0  0;         
          0  1  0; 
          0  0  0];

delta5 = [0 0 0 0 0;
          0 0 0 0 0;
          0 0 1 0 0;
          0 0 0 0 0;
          0 0 0 0 0];

delta7 = [0 0 0 0 0 0 0;
          0 0 0 0 0 0 0;
          0 0 0 0 0 0 0;
          0 0 0 1 0 0 0;
          0 0 0 0 0 0 0;
          0 0 0 0 0 0 0;
          0 0 0 0 0 0 0];

%% Applying Filters

% Apply High-Pass 3x3
R = filter2(highpass3, img(:,:,1));
G = filter2(highpass3, img(:,:,2));
B = filter2(highpass3, img(:,:,3));
newimghi(:,:,1) = uint8(R);
newimghi(:,:,2) = uint8(G);
newimghi(:,:,3) = uint8(B);

% Apply Delta 3x3
R = filter2(delta3, newimghi(:,:,1));
G = filter2(delta3, newimghi(:,:,2));
B = filter2(delta3, newimghi(:,:,3));
filt3(:,:,1) = uint8(R);
filt3(:,:,2) = uint8(G);
filt3(:,:,3) = uint8(B);

% Apply High-Pass 5x5
R = filter2(highpass5, img(:,:,1));
G = filter2(highpass5, img(:,:,2));
B = filter2(highpass5, img(:,:,3));
newimghi(:,:,1) = uint8(R);
newimghi(:,:,2) = uint8(G);
newimghi(:,:,3) = uint8(B);

% Apply Delta 5x5
R = filter2(delta5, newimghi(:,:,1));
G = filter2(delta5, newimghi(:,:,2));
B = filter2(delta5, newimghi(:,:,3));
filt5(:,:,1) = uint8(R);
filt5(:,:,2) = uint8(G);
filt5(:,:,3) = uint8(B);

% Apply High-Pass 7x7
R = filter2(highpass7, img(:,:,1));
G = filter2(highpass7, img(:,:,2));
B = filter2(highpass7, img(:,:,3));
newimghi(:,:,1) = uint8(R);
newimghi(:,:,2) = uint8(G);
newimghi(:,:,3) = uint8(B);

% Apply Delta 7x7
R = filter2(delta7, newimghi(:,:,1));
G = filter2(delta7, newimghi(:,:,2));
B = filter2(delta7, newimghi(:,:,3));
filt7(:,:,1) = uint8(R);
filt7(:,:,2) = uint8(G);
filt7(:,:,3) = uint8(B);

%% Plotting Images for Comparison

figure
subplot(2,2,1), imshow(img);
title('Original Image')
subplot(2,2,2), imshow(filt3);
title('3x3 Matricies Applied')
subplot(2,2,3), imshow(filt5);
title('5x5 Matricies Applied')
subplot(2,2,4), imshow(filt7);
title('7x7 Matricies Applied')

%% Questions

% Do you see any difference in results with the new matrices?

% I see a slight difference. The highlights seem to be more pronounced,
% around the end of the cat's whiskers, lighter hairs, and on the floor in
% the background. The yellow colour of the ambient light also starts to
% fade, making the cat look more older, salt-and-pepper haired. The border
% where the cat's iris starts and the fur stops is also the most
% pronounced after using the 7x7 matricies.

% 1. What sequence of filters will you use and why?

% I used a high pass filter to sharpen the image, and then a delta filter 
% to smooth it out slightly and remove small artifacts. 

% 2. What other corrections need to be used.

% Other potential corrections would be colour correction, removing the
% ambient light entirely if desired, and the image has abbarations on the
% floor, which should be removed. The (I'm assuming) lens flare on the 
% cat's ear should also be removed. The image should also probably be
% smoothed out more, as the sharp, noticible pixels on the cat's
% whiskers/hairs are distracting and unnatural.

% 3. Discuss the overall quality of your photo.

% I think overall the quality is adequate. The image has been sharpened, if
% that was the desired output. Further processing would be required to make
% this a professional grade photo, though I'm sure the photographer
% could've just as easily held their hand a little more still and make it
% easier on the processing side. 
