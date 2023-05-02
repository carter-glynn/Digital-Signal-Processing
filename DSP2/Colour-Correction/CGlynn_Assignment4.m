clear;

RGB = imread('Sunset2.jpg');

%% Colour Balancing Algorithm

[height, width, color] = size(RGB);
figure, imshow(RGB); title('Origianl JPEG Image');
R = sum(sum(RGB(:,:,1)));         % Compute sum of R
G = sum(sum(RGB(:,:,2)));         % Compute sum of G
B = sum(sum(RGB(:,:,3)));         % Compute sum of B
gr = 1;
gg = 1;
gb = 1;
if G<R
    if G<B   
        gr = G/R;                 % Normalized gain factor for R 
        gb = G/B;                 % Normalized gain factor for B 
    end
end
if R<G
    if R<B   
        gg = R/G;                 % Normalized gain factor for G 
        gb = R/B;                 % Normalized gain factor for B 
    end
end
if B<R
    if B<G
        gr = B/R;                 % Normalized gain factor for R 
        gg = B/G;                 % Normalized gain factor for G 
    end
end
Rw=RGB(:,:,1)*double(gr);		 % Apply normalized gain factor to R
Gw=RGB(:,:,2)*double(gg);		 % Apply normalized gain factor to G 
Bw=RGB(:,:,3)*double(gb);		 % Apply normalized gain factor to B
RGBw(:,:,1) = Rw;
RGBw(:,:,2) = Gw;
RGBw(:,:,3) = Bw;

%% Adding "Haze Reduction" and Balancing the Histogram

hist = histeq(imreducehaze(RGBw));

%% Manual Balancing
grmanbal = 0.85;           
ggmanbal = 1.5;                  
gbmanbal = 3;
Rmanbal=RGB(:,:,1)*double(grmanbal);
Gmanbal=RGB(:,:,2)*double(ggmanbal);
Bmanbal=RGB(:,:,3)*double(gbmanbal);
RGBmanbal(:,:,1) = Rmanbal;
RGBmanbal(:,:,2) = Gmanbal;
RGBmanbal(:,:,3) = Bmanbal;


%% Display Figures

figure(1)
imshow(RGB)
title('Original Image')

figure(2)
imshow(RGBw)
title('White Balanced RGB Image with Algorithm (RGBw)');

figure(3)
imshow(hist)
title('"Reduced Haze" and Eqalized Histogram (Using RGBw as base)');

figure(4)
imshow(RGBmanbal)
title('Manually Balanced')

%% Questions

% 1. What is the downside of Colour Correction?

% The downside of colour correction is over-correction, as can be seen in
% how the sunset picture, after correction, appears more blue/green than
% the natural colours (Assuming the clouds should be white). Colour
% correction is also unable to deal with the effect of highlights and
% shadows, as evidenced by the lack of any colour in the foreground of the
% sunset. 

% 2. How can you remedy this?

% We can remedy this by approaching the task as a multi-complexity problem.
% Not just one form of image processing is always suitable. We may need to
% employ more than one technique (such as gamma or histogram correction to
% alter shadows and highlights). Specific to this algorithm, we can
% (attempt) to fix this by instead adjusting the gain factors manually as
% you can see I've tried to do.