function Result = ImageBordering(InputImage,C)

Color(:,:,1)=C(1,1);
Color(:,:,2)=C(1,2);
Color(:,:,3)=C(1,3);
Color=uint8(Color);


Border=imread('border.png');
[H,W,L]=size(InputImage);
Border=imresize(Border,[H,W]);

Result=uint8(zeros(H,W,L));
for i=1:H
    for j=1:W 
        if(Border(i,j,:) >100 && Border(i,j,:)<220)
            Result(i,j,1)=InputImage(i,j,1);
            Result(i,j,2)=InputImage(i,j,2);
            Result(i,j,3)=InputImage(i,j,3);
        elseif(Border(i,j,1) >= 0 && Border(i,j,1)<100)
            Result(i,j,1) = Color(:,:,1);
            Result(i,j,2) =Color(:,:,2);
            Result(i,j,3) =Color(:,:,3);
        else
            Result(i,j,1)=190;
            Result(i,j,2)=190;
            Result(i,j,3)=190;
        end
    end
end


end

