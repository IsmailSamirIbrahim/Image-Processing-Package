function R = AddTwoImages(I1,I2,fract)

[H ,W ,~]=size(I1);
I2 = imresize(I2, [H ,W]);
R=I1*fract + I2*(1-fract);

end

