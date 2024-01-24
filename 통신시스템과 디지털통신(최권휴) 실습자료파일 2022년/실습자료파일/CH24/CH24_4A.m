    clear
    randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
    EbN0dBvector=0:1:9;
    DataBitSize=1000;
    Eb=1;  % 비트 심벌로 +1,-1을 갖는 Bipolar signal 가정.
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
