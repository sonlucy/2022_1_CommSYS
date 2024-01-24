clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
EbN0dB_vector=0:5:30;  %Lower the limit of EbN0dB(currently 30) to speed up the simulation
Eb=1; %Because we set the symbol by s=sign(rand(Nt,1)-0.5) below.
Nr=4;Nt=4;

for snr_i=1:length(EbN0dB_vector)
    EbN0dB=EbN0dB_vector(snr_i);
    EbN0=10^(EbN0dB/10);
    N0=Eb/EbN0;
    
    Nerrs_zf=0;   Nerrs_sic=0;  Nerrs_osic=0;  Nerrs_ml=0;
    Nbits=0;
    Nerrs_stop=100;%Decrease Nerrs_stop if the simulation takes long time but the simulation error will increase.
    while Nerrs_osic < Nerrs_stop
        
        s=sign(rand(Nt,1)-0.5)+j*sign(rand(Nt,1)-0.5); 
        
        H=sqrt(0.5/Nr)*(randn(Nr,Nt)+j*randn(Nr,Nt));
        n=sqrt(N0/2)*(randn(Nr,1)+j*randn(Nr,1));
        
        r=H*s+n;
        
        shat_zf=zf_qpsk(r,H);  shat_sic=sic_zf_qpsk(r,H);
        shat_osic=osic_zf_qpsk(r,H);  shat_ml=ml_Nt4_qpsk(r,H);

        Nerrs_zf=Nerrs_zf+sum(real(shat_zf)~=real(s))+sum(imag(shat_zf)~=imag(s));
        Nerrs_sic=Nerrs_sic+sum(real(shat_sic)~=real(s))+sum(imag(shat_sic)~=imag(s));
        Nerrs_osic=Nerrs_osic+sum(real(shat_osic)~=real(s))+sum(imag(shat_osic)~=imag(s));
        Nerrs_ml=Nerrs_ml+sum(real(shat_ml)~=real(s))+sum(imag(shat_ml)~=imag(s));

        
        Nbits=Nbits+2*Nt;
    end
    
    BER_vector(snr_i,:)=[Nerrs_zf Nerrs_sic Nerrs_osic  Nerrs_ml]/Nbits
    
end
figure
semilogy(EbN0dB_vector, BER_vector)
legend('ZF', 'SIC','OSIC', 'ML')
xlabel('E_b/N_0');ylabel('BER');grid
