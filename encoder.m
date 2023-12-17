clc;
img = imread("peppers.tif");
load('watermark.mat');

dct = dct2(double(img));

alpha = 0.2;

area1 = dct(1:64, 65:128);
area2 = dct(65:128, 65:128);
area3 = dct(65:128, 1:64);

area1_w = embedding(area1,w1,alpha);
area2_w = embedding(area2,w2,alpha);
area3_w = embedding(area3,w3,alpha);

dct(1:64, 65:128) = area1_w;
dct(65:128, 65:128) = area2_w;
dct(65:128, 1:64) = area3_w;

dct_inverse = idct2(dct);
dct_inverse = uint8(dct_inverse);

imshow(dct_inverse);
imwrite(dct_inverse, "watermark.tif");
