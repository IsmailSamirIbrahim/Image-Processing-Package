function R = SubTwoImages(I1,I2)

[H ,W ,~]=size(I1);

I2=imresize(I2,[H W]);

Tmp=(double(I1) - double(I2));

R=Contrast(Tmp,0,255);


end

