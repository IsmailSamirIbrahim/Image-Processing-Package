function R = Gamma(I, gammaValue)

[~ , ~ , L]=size(I);

for i=1:L
    
    TmpBuf = double(I(:,:,i));
    TmpBuf = TmpBuf.^gammaValue;
    I(:,:,i)=Contrast(TmpBuf,0,255);
end

R=I;

end

