function R = Translate(I, XOffset)

[H, W, L] = size(I) ;
R = uint8(zeros(H, W, L));
for	y=1:H
    for x=1:W
        NewX = x + XOffset ;
        if (NewX > W )
            NewX= NewX-W;
        end
        if(NewX <1)
            NewX= NewX+W;
        end
        R(y, NewX, :) = I(y, x, :);
    end
end
end
