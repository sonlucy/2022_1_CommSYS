global E D;
for ddd=1
    if (E==1)&(D==1)&(sum(DecodedBits~=DataBits)<20)
        char(bin2dec(reshape(dec2bin(DataBits)',L,W)'))'
        sprintf('마지막 실습을 성공적으로 수행하였습니다. \n한 학기 실습을 열심히 한 여러분을 위한 곡입니다.')
        pause(3);web('https://youtu.be/tqyBca2EDok');        
    else
        T=length( DecodedBits);
        posi=ceil(rand(1,3)*T);
        DecodedBits(posi)=not(DataBits(posi));
        char(bin2dec(reshape(dec2bin(DecodedBits)',L,W)'))'
    end
end