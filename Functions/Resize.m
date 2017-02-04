function Result = Resize( InputImage )

figure,imshow(InputImage);
[H,W,L]=size(InputImage);
Tmp=ones(500,500,L);

for i=1:H
    for j=1:W
        Tmp(i,j,:)=Tmp(i,j,:)&InputImage(i,j,:);
    end
end

figure,imshow(Tmp);


[~, Rect] = imcrop(InputImage);


OriginalSize=H*W;
Resized=Rect(1,3)*Rect(1,4);

Ratio=double(Resized)/double(OriginalSize);
Result= imresize(InputImage,Ratio);

figure,imshow(Result);

end

