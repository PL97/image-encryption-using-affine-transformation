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
title('ԭͼ');

%%
%�������
%��ת90
theta = pi/2;
xform = [ cos(theta), sin(theta), 0; -sin(theta), cos(theta), 0;0, 0, 1 ];
%ƽ�Ʒ���任
deltaX = 0;
deltaY = 0;
xform1 = [1, 0, deltaX; 0, 1, deltaY;0, 0, 1];
%�Զ���
xform2 = [10, 0, 0;0, 10, 0; 0, 0, 1];
%xformΪ�������
tform_translate = maketform('affine', xform);
[I xdata ydata]= imtransform(I, tform_translate);
subplot(2,2,2);
imshow(I);
imwrite(I, 'result.jpg');
title('����任��ͼ����ת90�㣩');

h = length(I(:, 1));
w = length(I(1, :));
%%
%˫�����λ
R1 = exp(i*pi*2*rand(h, w)); % ��һ�����λ
R2 = exp(i*pi*2*rand(h, w)); % �ڶ������λ
I = fft2(fft2(I.*R1).*R2); % ˫�����λ����
subplot(2, 2, 3);imshow(abs(I),[]); % ��ʾ����ͼ

%�������������e.g. 4 [0, 4]��Χ�ڵľ��ȷֲ�
I = rubustTest(I, 10000);
%�ڵ� e.g.100 ��Ӧ�ڵ�����1/100
%I = shelter(I, 8/7);

%%
temp = reveal(I, xdata, ydata, H, R1, R2, xform);
subplot(2,2,4);
imshow(temp);
title('ifft2��ĸ�ԭͼ��');

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