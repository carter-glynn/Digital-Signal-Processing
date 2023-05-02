clear;

[print1,map1] = imread('Print2.bmp');
[print2,map2] = imread('Print4.bmp');

%% My Little Algorithm
eq1 = histeq(print1);
eq2 = histeq(print2);

gray1 = rgb2gray(eq1);
gray2 = rgb2gray(eq2);

adj1 = imadjust(gray1);
adj2 = imadjust(gray2);

bin1 = imbinarize(adj1);
bin2 = imbinarize(adj2);

%% DWT
% Map contains the loaded colormap. 
nbcol2 = size(map2,1);
nbcol1 = size(map1,1);


% generate Decomposition and Reconstruction filter coefficients
[L_D2,H_D2,L_R2,H_R2] = wfilters('db2'); % Lowpass decomposite, highpass decomposite
[L_D1,H_D1,L_R1,H_R1] = wfilters('db2');


% Perform single-level decomposition 
[LL2,LH2,HL2,HH2] = dwt2(print2,L_D2,H_D2);	% 2-D DWT
[LL1,LH1,HL1,HH1] = dwt2(print1,L_D1,H_D1);

% Images coding
dec2d = [LL2,  LH2;
         HL2,  HH2];
dec2d = [LL1,  LH1;
         HL1,  HH1];

% Construction filter
LL2 = zeros(size(LL2));     % Zero out the LL
LL1 = zeros(size(LL1));

% Reconstruct the image
Y2 = idwt2(LL2,LH2,HL2,HH2,L_R2,H_R2);    % Inverse 2-D DWT
Y1 = idwt2(LL1,LH1,HL1,HH1,L_R1,H_R1);

%% My Little Algorithm: The Empire Strikes Back

Ybin2 = imbinarize(Y2);
Ybin1 = imbinarize(Y1);

Yfilled2 = imfill(Ybin2, 4, "holes"); % tries to fill the prints in as white, doesn't quite work all the way
Yfilled1 = imfill(Ybin1, 4, "holes");

Yinvert2 = imcomplement(Yfilled2);    % inverts prints
Yinvert1 = imcomplement(Yfilled1);

% Compare pixel by pixel
similarity = 0;
for n = 1:height(bin1)
    for k = 1:length(bin1)
        if (Yinvert1(n,k) == Yinvert2(n,k))
            similarity = similarity + 1;
        end
    end
end

percent = similarity/(height(bin1) * length(bin1)) * 100;

% Prints similarity percentage to the console
if (percent >= 90) 
    disp('IT''S A MATCH!!')
end
disp('Percent similarity: ')
disp(percent)

%% Plotting

figure;
clf
imagesc(bin1);
axis equal
axis off
colormap(gray(128));
title('The original image');

figure;
imagesc(dec2d) ;
axis equal
axis off
colormap(gray(128));
title('Decomposed image');

figure;
subplot(1,2,1), imagesc(Yinvert1); 
axis equal
axis off
title('Reconstructed Print2 without the LL subband');
subplot(1,2,2), imagesc(Yinvert2); 
axis equal
axis off
title('Reconstructed Print4 without the LL subband');

%% Questions

% What characteristics are you looking for? How much deviation will you tolerate?

% I am looking for the shapes of the prints pixel-by-pixel to determine a
% match. I have it set to 90% tolerance, and the percentage comes out as
% 98% match.

% 1. How does DWT break the photos down into their constituent parts?

% DWT takes the "shadow" feature of each direction on a binary image, and removes
% the LL subband to be left with only the three "shadows". Those being
% horizontal, vertical, and diagonal features. This can be repeated a
% desired number of times.

% 2. What are the criteria for determining a match?

% 90% same pixels?

% 3. Can this automated to go through large databanks? What are the limitations?

% This could be automated, however one of the limitations is that DWT is
% computationally expensive. Another is that different factors can affect
% the validity of the prints acquired such as lighting. This algorithm
% specifically will not work if the two images are of differing resolution.

% 4. Could this be done using image filter files?

% Yes, you could run a command that allowed values through a filter, count
% the number of values allowed through, and compare that against the total
% number of values in the original image. 


