clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
Nf=10;
Nc=16;T=10e-5;
f_delta=1/T;
t_step=T/Nc;
t_vector=0:t_step:(T-t_step); %=t_step*(0:Nc-1)
Ns=length(t_vector); %Number of samples in one OFDM symbol duration T
Eb=1;
EbN0dBvector=0:3:9;
for k=0:(Nc-1)
    k_th_subcarrier=1/sqrt(T)*exp(j*2*pi*k*f_delta*t_vector);
    subcarrier_matrix(k+1,:)=k_th_subcarrier;
    %OFDM변복조에 사용하기위해 서브캐리어들을 subcarrier_matrix의 행들로 저장.
end
for snr_i=1:length(EbN0dBvector)
    EbN0dB=EbN0dBvector(snr_i);
    EbN0=10^(EbN0dB/10);
    N0=Eb/EbN0;
    vn=N0/(2*t_step); % 21장의 문제 1번 참고
    
    bitcnt=0; errcnt=0;
    while errcnt<100
        
        %%%%%%%%%%%%% Transmitter  %%%%%%%%%%%%%%%
        OFDM_frame=[];
        for m=1:Nf
            data_symbols_in_OFDMsymbol=sign(rand(1,Nc)-0.5)+j*sign(rand(1,Nc)-0.5);
            data_symbols_in_OFDMframe(m,:)=data_symbols_in_OFDMsymbol;
            xt=zeros(1,Ns);
            for k=0:(Nc-1)
                s_k=data_symbols_in_OFDMsymbol(k+1);
                xt=xt+s_k*subcarrier_matrix(k+1,:);
            end
            OFDM_frame=[OFDM_frame xt];
        end
        
        %%%%%%%%%%%% AWGN Channel and received signal generation %%%%%%%%%%
        noise=sqrt(vn)*(randn(1,length(OFDM_frame))+j*randn(1,length(OFDM_frame)));
        rt_frame=OFDM_frame+noise;
        
        %%%%%%%%%%%%%% Receiver %%%%%%%%%%%%%%%%%%%%%%
        for m=1:Nf
            mth_OFDMsymbol_in_rt=rt_frame((m-1)*Ns+(1:Ns));
            for k=0:(Nc-1)
                k_th_subcarrier =subcarrier_matrix(k+1,:);
                D=t_step*sum( mth_OFDMsymbol_in_rt.*conj(k_th_subcarrier));
                estimated_data_symbols_in_OFDMframe(m,k+1)=sign(real(D))+j*sign(imag(D));
            end
        end
        
        Ierrs=sum(sum(real(data_symbols_in_OFDMframe)~=real(estimated_data_symbols_in_OFDMframe)));
        Qerrs=sum(sum(imag(data_symbols_in_OFDMframe)~=imag(estimated_data_symbols_in_OFDMframe)));
        errcnt=errcnt+(Ierrs+Qerrs);
        bitcnt=bitcnt+Nc*Nf*2;
    end
    
    BER(snr_i)=errcnt/bitcnt
    BERtheory(snr_i)=0.5 *erfc(sqrt(EbN0)); %AWGN에서의 단일반송파 QPSK BER 공식, ‘EbN0’의 함수로 표현
end
figure
semilogy(EbN0dBvector, BER,'b')
hold on
semilogy(EbN0dBvector, BERtheory,'r')
grid
legend('Simulated, OFDM','Theoretical, single carrier QPSK(or BPSK)')
