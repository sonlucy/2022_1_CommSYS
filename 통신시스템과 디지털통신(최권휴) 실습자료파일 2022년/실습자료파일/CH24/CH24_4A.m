    clear
    randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
    EbN0dBvector=0:1:9;
    DataBitSize=1000;
    Eb=1;  % ��Ʈ �ɹ��� +1,-1�� ���� Bipolar signal ����.
    for snri=1:length(EbN0dBvector)
        EbN0dB=EbN0dBvector(snri);
        EbN0=10^(EbN0dB/10);
        N0=Eb/EbN0; 
        BitErrNum=0;
        TotalBits=0;
        while BitErrNum<100
              DataBits=(rand(1,DataBitSize)>0.5);
              ChannelSymbols=sqrt(Eb)*(2*DataBits-1);
              r=ChannelSymbols+sqrt(N0/2)*randn(1,length(ChannelSymbols));
              DataBitsHat=r>0;
              BitErrs=sum(DataBits~=DataBitsHat);
              BitErrNum=BitErrNum+BitErrs;
              TotalBits=TotalBits+DataBitSize;
        end
        uncodedBER(snri)=?/?
    end
