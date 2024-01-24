clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
DataBitSize=1000;
coderate=1/2;
Eb=1; % 코딩 전 데이터 비트 에너지를 1로 설정.
Eb_coded=Eb*coderate;  %채널 심벌(encoder 출력의 비트)의 에너지.
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
        z=r>0;  %경판정을 위한 부분
        DecodedBits=?(?);
        BitErrs=sum(DataBits~=DecodedBits);
        BitErrNum=BitErrNum+BitErrs;
        TotalBits=TotalBits+DataBitSize;
    end
    CodedBER(snri)=?/?
end
