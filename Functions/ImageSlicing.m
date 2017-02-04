function Result = ImageSlicing(InputImage,Bit)
[H,W,L]=size(InputImage);
Result=uint8(zeros(H,W,L));
for i=1:H
    for j=1:W
        Value=bitand(InputImage(i,j,1),Bit);
        if(Value == Bit)
            Result(i,j,1)=255;
            Result(i,j,2)=255;
            Result(i,j,3)=255;
        end
    end
end

end

