function image_out=D3_To_D2(image_in)
[m,n]=size(image_in);
 n=n/3;%由于我的灰度图像是185x194x3的，所以除了3，你们如果是PxQ的，就不要加了
 A=zeros(m,n);%构造矩阵
 for i=1:m
     for j=1:n
        A(i,j)= image_in(i,j);%填充图像到A
     end
 end
image_out=uint8(A);