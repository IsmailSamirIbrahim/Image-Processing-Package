function R = ColorCorrection(I1,I2, N)



[H ,W, L]=size(I1);
%generate random points 
RandHW =rand(2,N);
RW =RandHW(1,:)*W;
RH=RandHW(2,:)*H;
Rpoints=uint32([RW;RH]);

Iold=zeros(3,N);
Inew=zeros(3,N);

N=uint32(N);
% extract the color of random points
for i=1:N
        Iold(:,i)=I2(Rpoints(2,i),Rpoints(1,i),:);
        Inew(:,i)=I1(Rpoints(2,i),Rpoints(1,i),:);
end

% building the color correction equation
TmpMat1 =Inew';
tmp1= Iold * TmpMat1;
tmp2= Inew * TmpMat1;
CC = tmp1 * (tmp2 ^ -1);

New =uint8(zeros(H,W,L));
Tmp=zeros(L,1);
for Y=1:H
    for X=1:W
            Tmp(:,1)=I1(Y,X,:);
        New(Y,X,:)= double(CC) * double(Tmp);
    end
end
R=New;
end