function Result = Negative( InputImage,Value )

[H,W,L]=size(InputImage);
Result=uint8(zeros(H,W,L));

for i=1:H
    for j=1:W
        Result(i,j,1)=uint8(Value-InputImage(i,j,1));
        Result(i,j,2)=uint8(Value-InputImage(i,j,2));
        Result(i,j,3)=uint8(Value-InputImage(i,j,3));
       
    end
end

end

