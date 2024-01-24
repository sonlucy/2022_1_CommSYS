clear
EbN0dB_vector=0:5:30;  %Lower the limit of EbN0dB(currently 30) to speed up the simulation
Eb=1; %Because we set the symbol by s=sign(rand(Nt,1)-0.5) below.
Nr=2;Nt=2;

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
        shat_osic=osic_zf_bpsk(r,H);  shat_ml=ml_Nt2_bpsk(r,H);
        
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
