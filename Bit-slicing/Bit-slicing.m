clc; clear all; close all;

% Load and display original image
img = imread('Lin-Dan.jpg');
imshow(img);
title('Original Image');
[rows, cols] = size(img);

figure;

% Bit plane slicing
% Extract bit plane 0
for i = 1:rows
    for j = 1:cols
        plane0(i,j) = bitand(img(i,j), 1);
    end
end

% Extract bit plane 1
for i = 1:rows
    for j = 1:cols
        plane1(i,j) = bitand(img(i,j), 2);
    end
end

% Extract bit plane 2
for i = 1:rows
    for j = 1:cols
        plane2(i,j) = bitand(img(i,j), 4);
    end
end

% Extract bit plane 3
for i = 1:rows
    for j = 1:cols
        plane3(i,j) = bitand(img(i,j), 8);
    end
end

% Extract bit plane 4
for i = 1:rows
    for j = 1:cols
        plane4(i,j) = bitand(img(i,j), 16);
    end
end

% Extract bit plane 5
for i = 1:rows
    for j = 1:cols
        plane5(i,j) = bitand(img(i,j), 32);
    end
end

% Extract bit plane 6
for i = 1:rows
    for j = 1:cols
        plane6(i,j) = bitand(img(i,j), 64);
    end
end

% Extract bit plane 7
for i = 1:rows
    for j = 1:cols
        plane7(i,j) = bitand(img(i,j), 128);
    end
end

% Display all bit planes
imshow(plane0); title('0th bit plane Image');
figure; imshow(plane1); title('1st bit plane Image');
figure; imshow(plane2); title('2nd bit plane Image');
figure; imshow(plane3); title('3rd bit plane Image');
figure; imshow(plane4); title('4th bit plane Image');
figure; imshow(plane5); title('5th bit plane Image');
figure; imshow(plane6); title('6th bit plane Image');
figure; imshow(plane7); title('7th bit plane Image');

% Bit plane removal
% Remove 0th, 5th and 7th bit planes from original image
for i = 1:rows
    for j = 1:cols
        removed_p0(i,j) = bitand(img(i,j), (255 - (2^(0))));
        removed_p5(i,j) = bitand(img(i,j), (255 - (2^(5))));
        removed_p7(i,j) = bitand(img(i,j), (255 - (2^(7))));
    end
end

% Display images with bit planes removed
figure; imshow(removed_p0); title('0th bit plane removed Image');
figure; imshow(removed_p5); title('5th bit plane removed Image');
figure; imshow(removed_p7); title('7th bit plane removed Image');