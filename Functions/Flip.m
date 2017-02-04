function Result = Flip( InputImage,Flage )

Result=[];
if(Flage == 1)
Result = InputImage(:,end:-1:1,:);           %# horizontal flip
elseif(Flage == 2)
Result=InputImage(end:-1:1,:,:);             %# vertical flip    
else
Result=InputImage(end:-1:1,end:-1:1,:);    %# horizontal+vertical flip    
end


end

