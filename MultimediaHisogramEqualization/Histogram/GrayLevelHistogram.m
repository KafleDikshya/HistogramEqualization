sourcePic=imread('fig1.jpg'); %reads the original image
grayPic=sourcePic;
[m,n]=size(grayPic);
subplot(2,1,1);%shows the original image
imshow(grayPic);
gp=zeros(1,256); %Calculate the probablity of occurence of each gray scale 
for i=1:256
	gp(i)=length(find(grayPic==(i-1)))/(m*n);
end
subplot(2,1,2);%shows the image histogram
bar(0:255,gp);
title('Original Image Histogram');
xlabel('Gray Value');
ylabel('Probablity');
