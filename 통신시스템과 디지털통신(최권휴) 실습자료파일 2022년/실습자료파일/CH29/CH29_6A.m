clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
EbN0dB_vector=0:5:30;  %PC 속도에 따라 EbN0dB(현재 30) 최대값 적절히 조절
Eb=1; %아래 while loop 내부에서 생성하는 s의 에너지,
Nr=4;Nt=4;

for snr_i=1:length(EbN0dB_vector)
    EbN0dB=EbN0dB_vector(snr_i);
    EbN0=10^(EbN0dB/10);
    N0=Eb/EbN0;
    
    Nerrs_zf=0;   Nerrs_sic=0;  Nerrs_osic=0;  Nerrs_ml=0;
    Nbits=0;
    Nerrs_stop=100;
    while Nerrs_osic < Nerrs_stop
        
        s=sign(rand(Nt,1)-0.5);
        
        H=sqrt(0.5/Nr)*(randn(Nr,Nt)+j*randn(Nr,Nt));
        n=sqrt(N0/2)*(randn(Nr,1)+j*randn(Nr,1));
        
        r=H*s+n;
        
        shat_zf=zf_bpsk(r,H);  shat_sic=sic_zf_bpsk(r,H);
        shat_osic=osic_zf_bpsk(r,H);  shat_ml=ml_Nt4_bpsk(r,H);
        
        Nerrs_zf=Nerrs_zf+sum(shat_zf~=s);
        Nerrs_sic=Nerrs_sic+sum(shat_sic~=s);
        Nerrs_osic=Nerrs_osic+sum(shat_osic~=s);
        Nerrs_ml=Nerrs_ml+sum(shat_ml~=s);
        
        Nbits=Nbits+Nt;
    end
    
    BER_vector(snr_i,:)=[Nerrs_zf Nerrs_sic Nerrs_osic  Nerrs_ml]/Nbits
    
end
figure
semilogy(EbN0dB_vector, BER_vector)
legend('ZF', 'SIC','OSIC', 'ML')
xlabel('E_b/N_0');ylabel('BER');grid
