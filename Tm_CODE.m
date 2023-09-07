% normxcorr2_general computes the normalized cross-correlation of matrices TEMPLATE and A. 
%The resulting matrix C contains correlation coefficients and its values may range from -1.0 to 1.0. 
clc;
clear all;
close all;
f=imread("C:\Users\Desktop\pcb.jpg");%read the input image
f=rgb2gray(f);%rgb2gray normxcorr2 2 dimensional working
figure(1);
imshow(f);
[Ir Ic]=size(f);
g=imread("C:\Users\Desktop\template.jpg"); %template reading
g=rgb2gray(g);%grayscaling
figure(2);
imshow(g);
[Tr Tc]=size(g);
%%
tic
cc=xcorr2(g,f);
figure,surf(cc),shading flat
toc
%[max_cc,imax] = find(max(abs(cc(:))));
%figure(3);
%plot(max_cc,imax,'or');
%%
ncc=normxcorr2(g,f);%calculate NCC

fprintf('%d x %d',size(ncc));
figure(4);imagesc(ncc); title('Output of normxcorr2');
ncc=imcrop(ncc,[Tc Tr Ic Ir]);%crop the extra pixels

GNCC = normxcorr2_general(g,f);

GNCC=imcrop(GNCC,[Tc Tr Ic Ir]);

fprintf('\n %d x %d\n',size(GNCC));
figure(5);imagesc(GNCC);title('Output of normxcorr2\_general');
[r c]= find(ncc==(max(max(ncc(:)))));%find the coordinates where maximum correlation exists

RGB=insertShape(f,'rectangle',[c r Tc Tr],'LineWidth',10);%creates a boundary around maximum correlation

figure(6);

imagesc(RGB);