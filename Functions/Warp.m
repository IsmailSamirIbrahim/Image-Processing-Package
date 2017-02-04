function R = Warp(I1, Pts1, Pts2)

[~,N,L]=size(Pts1);

Pts1(3,:)=ones(1,N);
P=Pts1;

Pts2(3,:)=ones(1,N);
Q=Pts2;

Tmp1=Q*(P');
Tmp2=P*(P');
Tmp2 = Tmp2 ^-1;

W=Tmp1*Tmp2;

disp(size(W));

Tmp=GeometricLinearTransform(I1,W);

%figure,imshow(Tmp);

NewH=uint32(max(Pts2(2,:)));
NewW=uint32(max(Pts2(1,:)));

R=Tmp(1:NewH,1:NewW,:);

%figure,imshow(R);


end

