function Result = MultiplyImage(I1,I2)

[H ,W ,~]=size(I1);
I2 = imresize(I2, [H ,W]);

R=int32(I1 .*I2);
Result=Contrast(R,0,255);

end

