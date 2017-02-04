function Result = Paint(InputImage,C)

Color(:,:,1)=C(1,1);
Color(:,:,2)=C(1,2);
Color(:,:,3)=C(1,3);
Color=uint8(Color);

Result=InputImage;
Level=graythresh(InputImage);
Img=im2bw(InputImage,Level);

[L,~]=bwlabel(Img);


[X,Y]=ginput(1);
Num=L(ceil(Y),ceil(X));

[R,C]=find(L==Num);
Tmp=[R,C];
for k=1:size(Tmp,1)
    Result(Tmp(k,1),Tmp(k,2),1)=Color(:,:,1);
    Result(Tmp(k,1),Tmp(k,2),2)=Color(:,:,2);
    Result(Tmp(k,1),Tmp(k,2),3)=Color(:,:,3);
end




end

