clear
randn(1,225); 
Nsim=(10000+225);
count=zeros(1,6);
for n=1:Nsim
    x=ceil(rand*6);
    if x==1
            count(1)=count(1)+1;
    elseif  x==2
            count(2)=count(2)+1;
    elseif  x==3
            count(3)=count(3)+1;
    elseif x==4
            count(4)=count(4)+1;
    elseif  x==5
            count(5)=count(5)+1;
    else
            count(6)=count(6)+1;

    end
end
Px=count/Nsim;
stem(1:6,Px)
