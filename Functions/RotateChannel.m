function Result = RotateChannel( InputImage )

[H,W,L]=size(InputImage);
Result=uint8(zeros(H,W,L));

for i=1:H
    for j=1:W
        Red=InputImage(i,j,1);
        Green=InputImage(i,j,2);
        Blue=InputImage(i,j,3);
       
        Result(i,j,1)=Green;
        Result(i,j,2)=Blue;
        Result(i,j,3)=Red;
       
    end
end

end

