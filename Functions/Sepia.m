function Result = Sepia(InputImage)

[H,W,L]=size(InputImage);

Result=uint8(zeros(H,W,L));


for i=1:H
    for j=1:W
        Tmp=uint8(0.299*InputImage(i,j,1) +0.587*InputImage(i,j,2)+0.114*InputImage(i,j,3));
        if(Tmp > 206)
            Result(i,j,1)=255;
        else
            Result(i,j,1)=Tmp+49;
        end
        if(Tmp < 14)
            Result(i,j,2)=0;
        else
            Result(i,j,2)=Tmp-14;
        end
        if(Tmp < 56)
            Result(i,j,3)=0;
        else
            Result(i,j,3)=Tmp-56;
        end
    end
end

end

