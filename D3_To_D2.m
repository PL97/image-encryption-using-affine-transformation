function image_out=D3_To_D2(image_in)
[m,n]=size(image_in);
 n=n/3;%�����ҵĻҶ�ͼ����185x194x3�ģ����Գ���3�����������PxQ�ģ��Ͳ�Ҫ����
 A=zeros(m,n);%�������
 for i=1:m
     for j=1:n
        A(i,j)= image_in(i,j);%���ͼ��A
     end
 end
image_out=uint8(A);