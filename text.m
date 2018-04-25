clc
close all
clear all
image=imread('image3.jpg');
sizes=size(image);
imtool(image);
image=imfilter(image,fspecial('average', 10));
imtool(image);
r_g=im2double(image(:,:,1)-image(:,:,2));
g_r=im2double(image(:,:,2)-image(:,:,1));
imtool(r_g);
imtool(g_r);

K=1;

bRG=mean2(r_g)+K*std2(r_g)
bGR=mean2(g_r)+K*std2(g_r)

for i=1:sizes(1)
    for j=1:sizes(2)
        if r_g(i,j) > 0.1
           image(i,j,:)=[255 0 0];
           continue;
        end
        if g_r(i,j) > 0.1
           image(i,j,:)=[0 255 0];
           continue;
        end
        image(i,j,:)=[0 0 0];
    end
end
imtool(image);

for i=1:sizes(1)
    for j=1:sizes(2)
        if r_g(i,j) > bRG
           image(i,j,:)=[255 0 0];
           continue;
        end
        if g_r(i,j) > bGR
           image(i,j,:)=[0 255 0];
           continue;
        end
        image(i,j,:)=[0 0 0];
    end
end
imtool(image);
%%
image=imread('image3.jpg');
image=im2double(image);
image=imfilter(image,fspecial('average', 10));
sizes=size(image);
for i=1:sizes(1)
    for j=1:sizes(2)
        Sum=sum(image(i,j,:));
        for k=1:3
            image(i,j,k)=image(i,j,k)/Sum;
        end
    end
end
imtool(image);
imtool(image(:,:,1));
imtool(image(:,:,2));
figure();
surfc(image(:,:,2));
figure();
surfc(image(:,:,3));
seg=image(140:159,180:199,:);
imtool(seg);
figure();
vector=zeros(3,400);
for i=1:20
    for j=1:20
        for k=1:3
            vector(k,20*(i-1)+j)=seg(i,j,k)
        end        
    end
end

scatter3(vector(1,:),vector(2,:),vector(3,:),'filled');
xlabel('r');
ylabel('g');
zlabel('b');
figure();
scatter(vector(1,:),vector(2,:));
xlabel('r');
ylabel('g');
%%
image=imread('01.png');
sizes=size(image);
imtool(image);
image=rgb2gray(image);
image=im2double(image);
surfc(image);
imtool(image);
imtool(im2bw(image,0.3));

IB=mean2(image)+K*std2(image)

imtool(im2bw(image,IB));





