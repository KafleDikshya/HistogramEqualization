sourcePic=imread('fig2.jpg'); %reads the original image
[m,n,o]=size(sourcePic);
grayPic=rgb2gray(sourcePic);
[m,n]=size(grayPic);
subplot(2,2,1);%shows the original image
imshow(grayPic);
gp=zeros(1,256); %Calculate the probablity of occurence of each gray scale 
for i=1:256
	gp(i)=length(find(grayPic==(i-1)))/(m*n);
end
subplot(2,2,2);%shows the image histogram
bar(0:255,gp);
title('Original Image Histogram');
xlabel('Gray Value');
ylabel('Probablity');
newGp=zeros(1,256); %calculates the probability of each new gray scale appearing
S1=zeros(1,256);
S2=zeros(1,256);
tmp=0;
for i=1:256
	tmp=tmp+gp(i);
	S1(i)=tmp;
	S2(i)=round(S1(i)*256);
end
for i=1:256
	newGp(i)=sum(gp(S2==i));
end
newGrayPic=grayPic; %fills the new gray value of each pixel 
for i=1:256
	newGrayPic(grayPic==(i-1))=S2(i);
end
subplot(2,2,3);
imshow(newGrayPic);
subplot(2,2,4);%shows the histogram after equalization
bar(0:255,newGp);
title('Equalized Histogram');
xlabel('Gray Value');
ylabel('Probablity of Occurence');
