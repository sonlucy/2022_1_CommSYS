global E D;
for ddd=1
    if (E==1)&(D==1)&(sum(DecodedBits~=DataBits)<20)
        char(bin2dec(reshape(dec2bin(DataBits)',L,W)'))'
        sprintf('������ �ǽ��� ���������� �����Ͽ����ϴ�. \n�� �б� �ǽ��� ������ �� �������� ���� ���Դϴ�.')
        pause(3);web('https://youtu.be/tqyBca2EDok');        
    else
        T=length( DecodedBits);
        posi=ceil(rand(1,3)*T);
        DecodedBits(posi)=not(DataBits(posi));
        char(bin2dec(reshape(dec2bin(DecodedBits)',L,W)'))'
    end
end