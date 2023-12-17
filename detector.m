clear all;
clc;

img = imread("watermark.tif");
load('watermark.mat');

dct = dct2(double(img));

area1 = dct(1:64, 65:128);
area2 = dct(65:128, 65:128);
area3 = dct(65:128, 1:64);

alpha = 0.2;

disp(strcat("Watermark 1",detection(area1,w1,alpha)));
disp(strcat("Watermark 2",detection(area2,w2,alpha)));
disp(strcat("Watermark 3",detection(area3,w3,alpha)));
