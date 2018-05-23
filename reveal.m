function result = reveal(I, xdata, ydata, H, R1, R2, xform)
    %%
    %��˫�����λ
    I = (ifft2(ifft2(I)./R2))./R1; % ˫�����λ����

    %%
    %�����任
    tform_translate = maketform('affine', inv(xform));
    [I xdata ydata]= imtransform(I, tform_translate);
    R = I(1:H, :);
    G = I(H + 1:2*H, :);
    B = I(2*H + 1:3*H, :);
    W = length(R(:, 1));
    H = length(R(1, :));
    tempI = zeros(W, H, 3);
    tempI(:, :, 1) = R;
    tempI(:, :, 2) = G;
    tempI(:, :, 3) = B;
    result = tempI;