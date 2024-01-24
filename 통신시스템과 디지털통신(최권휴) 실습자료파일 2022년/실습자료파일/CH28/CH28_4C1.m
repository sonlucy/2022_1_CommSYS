clear % 모든 변수 삭제
EbN0dB_vector=[0 3 6 9 12 15]; % 관심있는 SNR range의 값 들로 적당히 세팅
Eb=4; %BPSK(1 또는 -1)심벌을 네 심벌 주기에 걸쳐 보내므로(표 28.3 참조)
for snri=1:length(EbN0dB_vector) % snri 범위
    EbN0dB=EbN0dB_vector(snri); % EbN0dB_vector 설정
    EbN0=10.^(EbN0dB/10); % EbN0dB로부터 EbN0 구하는 식
    N0=Eb/EbN0; % Eb와 EbN0로부터 N0 구하는 식
    errcnt=0; symcnt=0; % 에러 수와 총 심벌 수 초기화
    while errcnt<1000 % 에러 수가 500이 되면 while 종료
        %%%%%%%%%%%%%%%% step 1. 송신 심벌 생성 %%%%%%%%%%%%%%
        s1=sign(rand-0.5); % s1신호는 BPSK 신호
        s2=sign(rand-0.5); % s2신호는 BPSK 신호
        s3=sign(rand-0.5); % s3신호는 BPSK 신호
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%페이딩 계수 및 노이즈 생성 %%%%%%%%%%%%%%%%%%%%%%%%
        hA=sqrt(1/2)*(randn+j*randn); % 안테나 A의 페이딩 계수
        hB=sqrt(1/2)*(randn+j*randn); % 안테나 B의 페이딩 계수
        hC=sqrt(1/2)*(randn+j*randn); % 안테나 C의 페이딩 계수
        n1=sqrt(N0/2)*(randn+j*randn); % T1구간의 수신 노이즈
        n2=sqrt(N0/2)*(randn+j*randn); % T2구간의 수신 노이즈
        n3=sqrt(N0/2)*(randn+j*randn); % T3구간의 수신 노이즈
        n4=sqrt(N0/2)*(randn+j*randn); % T4구간의 수신 노이즈
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%% step 2. Alamouti coding된 수신 신호 생성%%%%%%%%%%%
        r1=s1*hA+s2*hB+s3*hC+n1; % T1 구간 수신신호
        r2=-conj(s2)*hA+conj(s1)*hB+n2; % T2 구간 수신신호
        r3=conj(s3)*hA-conj(s1)*hC+n3; % T3 구간 수신신호
        r4=conj(s3)*hB-conj(s2)*hC+n4; % T4 구간 수신신호
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%ML decoding %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%% step 3. 모든 가능한 (s1, s2) 쌍을 생성 %%
        s1_s2_s3_set=[[1,1,1];[1,1,-1];[1,-1,1];[1,-1,-1];[-1,1,1];[-1,1,-1];[-1,-1,1];[-1,-1,-1];];
        % BPSK 신호에서 모든 가능한 s1, s2, s3 쌍 생성
        N_set=8; % 총 쌍의 수
        %%%%%% step 4. 각 쌍에 대하여 해당 쌍을 보냈다고 가정 했을 때 수신 신호 r1, r2, r3, r4 생성, 실제 수신
        %%%%% 신호 (r1, r2, r3, r4)와의 ED를 계산
        for k_set=1:N_set
            s1trial=s1_s2_s3_set(k_set,1); % s1trial 에 저장.
            s2trial=s1_s2_s3_set(k_set,2); % s2trial 에 저장.
            s3trial=s1_s2_s3_set(k_set,3); % s3trial 에 저장.
            r1trial=s1trial*hA+s2trial*hB+s3trial*hC; % 해당 쌍을 보냈다고 가정 했을 때 수신신호
            r2trial=-conj(s2trial)*hA+conj(s1trial)*hB; % 해당 쌍을 보냈다고 가정 했을 때 수신신호
            r3trial=conj(s3trial)*hA-conj(s1trial)*hC; % 해당 쌍을 보냈다고 가정 했을 때 수신신호
            r4trial=conj(s3trial)*hB-conj(s2trial)*hC; % 해당 쌍을 보냈다고 가정 했을 때 수신신호
            distance(k_set)=sum(abs([r1, r2, r3, r4]-[r1trial, r2trial, r3trial, r4trial]).^2);
            % 실제 수신 신호와의 유클리드 계산
        end
        %%%%%%%%%%% step 5. 모든 쌍중에서 ED가 가장 작은 쌍을 보낸 심볼 쌍으로 판단 %%%%
        [A B]= min(distance); % distance 중 가장 작은 원소의 인덱스를 B에 저장
        s1_hat=s1_s2_s3_set(B,1); % 가장 작은 거리에 해당하는 s1
        s2_hat=s1_s2_s3_set(B,2); % 가장 작은 거리에 해당하는 s2
        s3_hat=s1_s2_s3_set(B,3); % 가장 작은 거리에 해당하는 s3
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if(s1_hat~=s1) % 가정한 수신 신호 s1과 실제 수신신호s1가 다를 경우
            errcnt=errcnt+1; % 에러 수 1 증가.
        end
        if(s2_hat~=s2) % 가정한 수신 신호 s2와 실제 수신 신호 s2가 다를 경우
            errcnt=errcnt+1; % 에러 수 1 증가.
        end
        if(s3_hat~=s3) % 가정한 수신 신호 s3과 실제 수신신호s3가 다를 경우
            errcnt=errcnt+1; % 에러 수 1 증가.
        end
        symcnt=symcnt+3; % 몇개의 심벌(비트)에 대하여 에러체크를 수행했는지?
    end
    BER(snri)=errcnt/symcnt % BER = 에러 수 / 총 심벌 수
    save alamouti_ML_STBC_BER.mat EbN0dB_vector BER
end
figure % 그래프 창 출력
semilogy( EbN0dB_vector, BER); % EbN0dB_vector에 대한 BER 그래프 출력
grid % 격자 표시
