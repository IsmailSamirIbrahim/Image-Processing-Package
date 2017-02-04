function Result = DivideImage( I1,I2 )

[H ,W ,~]=size(I1);
I2 = imresize(I2, [H ,W]);

Result=uint8(I1 ./I2);

end

