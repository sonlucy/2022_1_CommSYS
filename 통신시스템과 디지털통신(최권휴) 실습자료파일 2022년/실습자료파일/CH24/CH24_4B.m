clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
DataBitSize=1000;
coderate=1/2;
Eb=1; % �ڵ� �� ������ ��Ʈ �������� 1�� ����.
Eb_coded=Eb*coderate;  %ä�� �ɹ�(encoder ����� ��Ʈ)�� ������.
EbN0dBvector=0:1:8;
for snri=1:length(EbN0dBvector)
    EbN0dB=EbN0dBvector(snri);
    EbN0=10^(EbN0dB/10);
    N0=Eb/EbN0;
    BitErrNum=0;
    TotalBits=0;
    while BitErrNum<100
        DataBits=(rand(1,DataBitSize)>0.5);
        EncodedBits=enc(?);
        ChannelSymbols=sqrt(Eb_coded)*(2*EncodedBits-1);
        r=ChannelSymbols+sqrt(N0/2)*randn(1,length(ChannelSymbols));
        z=r>0;  %�������� ���� �κ�
        DecodedBits=?(?);
        BitErrs=sum(DataBits~=DecodedBits);
        BitErrNum=BitErrNum+BitErrs;
        TotalBits=TotalBits+DataBitSize;
    end
    CodedBER(snri)=?/?
end
