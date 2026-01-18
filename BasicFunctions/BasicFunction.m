% Fundamental Operations for Image Processing in MATLAB
% Date: 14/01/2026

clc;
clear;
close all;

% Creating an 8x8 random matrix 
B = uint8(randi([0 255], 8, 8));
disp('Random 8x8 Matrix:');
disp(B);

% Read input image
I = imread("Lin-Dan.jpg");
figure;
imshow(I);
title('Original Image');

% Convert RGB image to grayscale
Ig = rgb2gray(I);
figure;
imshow(Ig);
title('Grayscale Image');

% Extract Red Channel only
I_red = I;
I_red(:,:,2) = 0;   % Remove Green channel
I_red(:,:,3) = 0;   % Remove Blue channel
figure;
imshow(I_red);
title('Red Channel Image');

% Convert grayscale image to uint8 explicitly
Ig_uint8 = uint8(Ig);

% Binary image using thresholding with uint8
threshold = uint8(130);
Img = Ig_uint8 > threshold;

figure;
imshow(Img);
title('Binary Image using uint8 Thresholding');
