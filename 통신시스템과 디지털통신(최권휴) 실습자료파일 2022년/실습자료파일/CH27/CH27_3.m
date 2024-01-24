clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
Nf=10;
L=5; max_delay=1.25e-5; decay_base=1;
Nc=16; T=8*max_delay;
t_step=(T/Nc)/16;
f_delta=1/T;
t_vector=0:t_step:(T-t_step); %=t_step*(0:Nc-1)
Ns=length(t_vector); %Cyclic Prefix를 삽입하기 전의 OFDM 심벌(T초)당 샘플 수
GI=1/4;
Ns_in_GI=ceil(Ns*GI);
Ns_total=Ns+Ns_in_GI;
Eb=1;
EbN0dBvector=0:3:18;

for k=0:(Nc-1)
    subcarrier=1/sqrt(T)*exp(j*2*pi*k*f_delta*t_vector);
    subcarrier_matrix(k+1,:)=subcarrier;
end

pilot_sk=ones(1,Nc);
xt=zeros(1,Ns);
for k=0:(Nc-1)
    s_k=pilot_sk(k+1);
    xt=xt+s_k*subcarrier_matrix(k+1,:);
end
xt_tail=xt((Ns-Ns_in_GI+1):Ns);
pilot_OFDMsymbol=[xt_tail  xt];

for snr_i=1:length(EbN0dBvector)
    EbN0dB=EbN0dBvector(snr_i);
    EbN0=10^(EbN0dB/10);
    N0=Eb/EbN0;
    vn=N0/(2*t_step); % 21장의 문제 1.C~D번 참고
    
    bitcnt=0; errcnt=0;
    while errcnt<1000  %PC 속도가 느리면 1000을 작은 값으로 줄일 것. 대신 실험오차 증가함
        
        OFDM_frame=[];
        for m=1:Nf
            datasymbols_in_OFDMsymbol=sign(rand(1,Nc)-0.5)+j*sign(rand(1,Nc)-0.5);
            datasymbols_in_OFDMframe(m,:)=datasymbols_in_OFDMsymbol;
            xt=zeros(1,Ns);
            for k=0:(Nc-1)
                s_k=datasymbols_in_OFDMsymbol(k+1);
                xt=xt+s_k*subcarrier_matrix(k+1,:);
            end
            xt_tail=xt((Ns-Ns_in_GI+1):Ns);
            xt=[xt_tail  xt];
            OFDM_frame=[OFDM_frame xt];
        end
        
        ht=ht_mp_ch(max_delay,L,decay_base,t_step);
        OFDM_frame_after_ht=conv(OFDM_frame,ht);
        frame_sample_length=length(OFDM_frame_after_ht);
        noise=sqrt(vn)*(randn(1,frame_sample_length)+j*randn(1,frame_sample_length));
        rt_frame=OFDM_frame_after_ht+noise;
        
        rt_pilot=conv(pilot_OFDMsymbol,ht);
        for k=0:(Nc-1)
            D=t_step*sum(rt_pilot(Ns_in_GI+(1:Ns)).*conj(subcarrier_matrix(k+1,:))/sqrt(T));
            F(k+1)=D/pilot_sk(k+1);
        end
        
        for m=1:Nf
            first_index_of_mth_OFDMsymbol=(m-1)*Ns_total+ Ns_in_GI + 1 ;
            mth_OFDMsymbol_in_rt=rt_frame(  first_index_of_mth_OFDMsymbol+(0:Ns-1) );
            for k=0:(Nc-1)
                D=t_step*sum( mth_OFDMsymbol_in_rt.*conj(subcarrier_matrix(k+1,:))/sqrt(T));
                Dc=D/F(k+1); %Dc는 채널 보상된 판별 변수를 의미함
                estimated_datasymbols_in_OFDMframe(m,k+1)=sign(real(Dc))+j*sign(imag(Dc));
            end
        end
        
        Ierrs=sum(sum(real(datasymbols_in_OFDMframe)~=real(estimated_datasymbols_in_OFDMframe)));
        Qerrs=sum(sum(imag(datasymbols_in_OFDMframe)~=imag(estimated_datasymbols_in_OFDMframe)));
        errcnt=errcnt+(Ierrs+Qerrs);
        bitcnt=bitcnt+Nc*Nf*2;
    end
    BER(snr_i)=errcnt/bitcnt
    %BERtheory(snr_i)=qfunc(sqrt(2*EbN0))
    BERtheory(snr_i)=1/2 - EbN0^(1/2)/(2*(EbN0 + 1)^(1/2))
end
figure
semilogy(EbN0dBvector, BER,'b')
hold on
semilogy(EbN0dBvector, BERtheory,'r')
grid
legend('BER simulation','BER theory (Rayleigh fading)')
