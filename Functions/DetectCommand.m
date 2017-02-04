function Command = DetectCommand( InputImage )



InputImage=rgb2gray(InputImage);
figure,imshow(InputImage);

Level=graythresh(InputImage);
Img=im2bw(InputImage,Level);
%figure,imshow(Img);

SE = strel('disk',2);
Tmp = imerode(Img,SE);
%figure,imshow(Tmp);
Tmp=imdilate(Tmp,SE);
%figure,imshow(Tmp);


[L ,num]=bwlabel(Tmp);
numPixels=zeros(num);
for i=1:num
    [r,c]=find(L==i);
    tmp=[r,c];
    numPixels(i)=size(tmp,1);
end
maximum=max(max(numPixels));

[H ,W ,~]=size(InputImage);
outputtmp=zeros(H,W,1);
List=[];
R=0;C=0;
for i=1:num
    [r,c]=find(L==i);
    tmp=[r c];
    if(size(tmp,1) == maximum)
        List=[r,c];
        R=r;
        C=c;
        break;
    end
end

maxy=max(R); miny=min(R);
maxx=max(C);minx=min(C);
for	i=1:size(List,1)
    outputtmp(List(i,1),List(i,2),1)=1;
end
outputImage = imcrop(outputtmp,[minx, miny,maxx-minx,maxy-miny]);
%figure,imshow(outputImage);

[H,W,~]=size(outputImage);
for y=H:-1:uint16(H/3)
    for x=1:W
       outputImage(y,x)=0;
    end
end

%figure,imshow(outputImage);

[~ ,Num]=bwlabel(outputImage);
Command=Num;
end

