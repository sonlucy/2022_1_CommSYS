clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
EbN0dB_vector=0:5:15;
Eb=1;

for snr_i=1:length(EbN0dB_vector)
    EbN0dB=EbN0dB_vector(snr_i);  EbN0=10^(EbN0dB/10); N0=Eb/EbN0;
    
    Nerrs_2by2=0;   Nerrs_2by3=0;  Nerrs_3by2=0;
    NsymsNt2=0; NsymsNt3=0;
    Nerrs_stop=200;
    while Nerrs_2by3 < Nerrs_stop
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Nr=2;Nt=2;
        s=sign(rand(Nt,1)-0.5);
        H=sqrt(1/Nr)*(randn(Nr,Nt)/sqrt(2)+j*randn(Nr,Nt)/sqrt(2));
        n=sqrt(N0/2)*(randn(Nr,1)+j*randn(Nr,1));
        r=H*s+n;
        shat=ml_Nt2_bpsk(r,H);
        Nerrs_2by2=Nerrs_2by2+sum(shat~=s);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Nr=3;Nt=2;
        s=sign(rand(Nt,1)-0.5);
        H=sqrt(1/Nr)*(randn(Nr,Nt)/sqrt(2)+j*randn(Nr,Nt)/sqrt(2));
        n=sqrt(N0/2)*(randn(Nr,1)+j*randn(Nr,1));
        r=H*s+n;
        shat=ml_Nt2_bpsk(r,H);
        Nerrs_3by2=Nerrs_3by2+sum(shat~=s);
        
        NsymsNt2=NsymsNt2+2;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Nr=2;Nt=3;
        s=sign(rand(Nt,1)-0.5);
        H=sqrt(1/Nr)*(randn(Nr,Nt)/sqrt(2)+j*randn(Nr,Nt)/sqrt(2));
        n=sqrt(N0/2)*(randn(Nr,1)+j*randn(Nr,1));
        r=H*s+n;
        shat=ml_Nt3_bpsk(r,H);
        Nerrs_2by3=Nerrs_2by3+sum(shat~=s);
        
        NsymsNt3=NsymsNt3+3;
    end
    
    BER_vector(snr_i,:)=[Nerrs_2by2/NsymsNt2 Nerrs_3by2/NsymsNt2 Nerrs_2by3/NsymsNt3]
end
figure
semilogy(EbN0dB_vector(1:snr_i), BER_vector)
legend('Nr=2, Nt=2', 'Nr=3, Nt=2','Nr=2, Nt=3')
xlabel('E_b/N_0');ylabel('BER');grid
