% created by - Dhairya Rathore
clc;
clear all;
close all;

% Read input image
Im = imread('IMG.jpg');

% Display initial image (as it is)
figure;
imshow(Im);
title('Initial Image');

% Convert to grayscale if needed
if size(Im,3) == 3
    Ig = rgb2gray(Im);
else
    Ig = Im;
end

% Display grayscale image
figure;
imshow(Ig);
title('Grayscale Image');

% 2-D Discrete Wavelet Transform on grayscale image
[LL, LH, HL, HH] = dwt2(Ig,'haar');

figure;
imshow(mat2gray(LL));
title('Approximation (LL)');

figure;
imshow(mat2gray(LH));
title('Vertical Detail (LH)');

figure;
imshow(mat2gray(HL));
title('Horizontal Detail (HL)');

figure;
imshow(mat2gray(HH));
title('Diagonal Detail (HH)');

% Image reconstruction using inverse DWT
recover = idwt2(LL, LH, HL, HH, 'haar');
recover = uint8(recover);

figure;
imshow(recover);
title('Recovered Image');
