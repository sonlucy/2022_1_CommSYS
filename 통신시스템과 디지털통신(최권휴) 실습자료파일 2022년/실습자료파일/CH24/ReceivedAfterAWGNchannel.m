function y=ReceivedAfterAWGNchannel(EncodedBits) 
load data_bits.mat DataBits
Eb=1;EbN0dB=3.3;EbN0=10^(EbN0dB/10);N0=Eb/EbN0;  %3.3 dB
coderate=length(DataBits)/length(EncodedBits);
Eb_coded=Eb*coderate;ChannelSymbols=sqrt(Eb_coded)*(2*(EncodedBits==1)-1);
y=ChannelSymbols+sqrt(N0/2)*randn(1,length(ChannelSymbols)); 