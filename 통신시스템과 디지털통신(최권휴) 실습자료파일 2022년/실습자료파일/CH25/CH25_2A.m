clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
EbN0dB_vector=0:2:20;

Eb=1;

for snr_i=1:length(EbN0dB_vector)
    EbN0dB=EbN0dB_vector(snr_i);
    EbN0=10.^(EbN0dB/10);
    N0=Eb/EbN0;
    sym_cnt=0;
    err_cnt=0;
    while err_cnt<500
        s=sqrt(Eb)*sign(rand-0.5);
        h=sqrt(1/2)*(randn+j*randn);
        n=sqrt(N0/2)*(randn+j*randn);
        
        r=?*s + ?;
        
        D=r*exp(-j*angle(h));
        s_hat=sign(D);
        if s_hat~=s
            err_cnt=err_cnt+1;
        end
        sym_cnt=sym_cnt+1;
    end
    BER(snr_i)=err_cnt/sym_cnt
end
figure
semilogy(EbN0dB_vector, BER)
xlabel('E_b/N_0 [dB]')
ylabel('BER')
grid
