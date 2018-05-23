I=imread('test.bmp');
%I = rgb2gray(I);
X = I;
R = I(:, :, 1);
G = I(:, :, 2);
B = I(:, :,  3);
H = length(R(:, 1));
I = [R;G;B];
figure;

I = im2double(I);
subplot(2,2,1);
imshow(X);
title('原图');

%%
%放射操作
%旋转90
theta = pi/2;
xform = [ cos(theta), sin(theta), 0; -sin(theta), cos(theta), 0;0, 0, 1 ];
%平移仿射变换
deltaX = 0;
deltaY = 0;
xform1 = [1, 0, deltaX; 0, 1, deltaY;0, 0, 1];
%自定义
xform2 = [10, 0, 0;0, 10, 0; 0, 0, 1];
%xform为仿射矩阵
tform_translate = maketform('affine', xform);
[I xdata ydata]= imtransform(I, tform_translate);
subplot(2,2,2);
imshow(I);
imwrite(I, 'result.jpg');
title('仿射变换后图像（旋转90°）');

h = length(I(:, 1));
w = length(I(1, :));
%%
%双随机相位
R1 = exp(i*pi*2*rand(h, w)); % 第一随机相位
R2 = exp(i*pi*2*rand(h, w)); % 第二随机相位
I = fft2(fft2(I.*R1).*R2); % 双随机相位编码
subplot(2, 2, 3);imshow(abs(I),[]); % 显示加密图

%加入随机噪声，e.g. 4 [0, 4]范围内的均匀分布
I = rubustTest(I, 10000);
%遮挡 e.g.100 对应遮挡比例1/100
%I = shelter(I, 8/7);

%%
temp = reveal(I, xdata, ydata, H, R1, R2, xform);
subplot(2,2,4);
imshow(temp);
title('ifft2后的复原图像');

% X = (pi/5:pi/5:2*pi);
% iteration = 9;
% result = zeros(1, iteration);
% for i = 1:iteration
%     testtheta = X(i);
%     xform1 = [ cos(testtheta), sin(testtheta), 0; sin(testtheta), cos(testtheta), 0;0, 0, 1 ];
%     temp1 = reveal(I, xdata, ydata, H, R1, R2, xform1);
%     result(1) = MyMSE(temp, temp1);
% end
% 
% figure;
% plot(X, result);