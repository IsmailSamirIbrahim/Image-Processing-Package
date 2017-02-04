function R= GeometricLinearTransform(I,W)

[Height , Width , L]=size(I);

[H ,WW,~]=size(W);

if(H == 3 && WW == 3)
    V1=W*[1;1;1];
    V2=W*[Width;1;1];
    V3=W*[1;Height;1];
    V4=W*[Width;Height;1];
elseif(H == 2 && WW == 2)
    V1=W*[1;1];
    V2=W*[Width;1];
    V3=W*[1;Height];
    V4=W*[Width;Height];
end


X=[V1(1,1),V2(1,1),V3(1,1),V4(1,1)];
Y=[V1(2,1),V2(2,1),V3(2,1),V4(2,1)];

MinX=min(X);MaxX=max(X);
MinY=min(Y);MaxY=max(Y);


NewWidth=uint32(MaxX-MinX);
NewHeight=uint32(MaxY-MinY);


if(H == 2 && WW == 2)
W(3,:)=[0,0];
W(:,3)=[-MinX ,-MinY ,1];
end


W=W^-1;


R = uint8(zeros(NewHeight , NewWidth, L));


for	y=1:NewHeight
	for x=1:NewWidth
        Temp=[x;y;1];
        Temp=double(Temp);
        OldP=W * Temp;
        OldP=uint32(OldP);
   
        if((OldP(1,1) >= 1) &&  (OldP(1,1) < Width) && (OldP(2,1) >= 1) && (OldP(2,1) < Height))
           R(y,x,:)=I(OldP(2,1),OldP(1,1),:);
        end
            
      
end
end
end

