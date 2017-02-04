function R = Brightness(I, Ch, Offset)

if (strcmp(Ch, 'Red'))
    I(:,:,1) = I(:,:,1)+Offset;
elseif (strcmp(Ch, 'Green'))
    I(:,:,2) = I(:,:,2)+Offset;
elseif (strcmp(Ch, 'Blue'))
   I(:,:,3) = I(:,:,3)+Offset;
end
R=I;
end

