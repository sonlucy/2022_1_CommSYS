clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
EbN0dB_vector=[0 3 6 9 12 15]; % EbN0 값을 dB 단위로 설정.
Eb=2; %BPSK(1 또는 -1)심벌을 두 심벌 주기에 걸쳐 보내므로(표 28.3 참조)

for snri=1:length(EbN0dB_vector)
    EbN0dB=EbN0dB_vector(snri);
    EbN0=10^(EbN0dB/10); 
    N0=Eb/EbN0; 
    errcnt=0; symcnt=0;
    while errcnt<500 
        s1=sign(rand-0.5);
        s2=sign(rand-0.5);
        
        %%%페이딩 계수 및 노이즈 생성 %%%%%%%%%%%%%
        hA=sqrt(1/2)*(randn+j*randn);
        hB=sqrt(1/2)*(randn+j*randn);
        n1=sqrt(N0/2)*(randn+j*randn);  %T1구간의 수신 노이즈
        n2=sqrt(N0/2)*(randn+j*randn);  %T2구간의 수신 노이즈
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %%%%%Alamouti coding된 수신 신호 생성%%%%%%%%%%%
        r1=hA*s1+hB*s2+n1;  %T1 구간 수신신호
        r2=?;     %T2 구간 수신신호
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %%%%%%Simple linear combining for decoding!!!!%%%%%%%%
        z1= ?; % s1의 판별변수
        z2= ?; % s2의 판별변수
        s1_hat=sign(real(z1));
        s2_hat=sign(real(z2));
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        if(s1_hat~=s1)
            errcnt=errcnt+1;
        end
        if(s2_hat~=s2)
            errcnt=errcnt+1;
        end
        symcnt=symcnt + 2;
    end
    
    BER(snri)=errcnt/symcnt;
    save alamouti_BER.mat EbN0dB_vector BER
end
figure
semilogy( EbN0dB_vector, BER);
title('Alamouti coded, BPSK, Rayleigh fading');
xlabel('Eb/N0 [dB');ylabel('BER');
grid on
