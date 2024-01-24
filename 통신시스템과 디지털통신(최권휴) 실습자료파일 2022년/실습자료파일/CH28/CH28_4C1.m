clear % ��� ���� ����
EbN0dB_vector=[0 3 6 9 12 15]; % �����ִ� SNR range�� �� ��� ������ ����
Eb=4; %BPSK(1 �Ǵ� -1)�ɹ��� �� �ɹ� �ֱ⿡ ���� �����Ƿ�(ǥ 28.3 ����)
for snri=1:length(EbN0dB_vector) % snri ����
    EbN0dB=EbN0dB_vector(snri); % EbN0dB_vector ����
    EbN0=10.^(EbN0dB/10); % EbN0dB�κ��� EbN0 ���ϴ� ��
    N0=Eb/EbN0; % Eb�� EbN0�κ��� N0 ���ϴ� ��
    errcnt=0; symcnt=0; % ���� ���� �� �ɹ� �� �ʱ�ȭ
    while errcnt<1000 % ���� ���� 500�� �Ǹ� while ����
        %%%%%%%%%%%%%%%% step 1. �۽� �ɹ� ���� %%%%%%%%%%%%%%
        s1=sign(rand-0.5); % s1��ȣ�� BPSK ��ȣ
        s2=sign(rand-0.5); % s2��ȣ�� BPSK ��ȣ
        s3=sign(rand-0.5); % s3��ȣ�� BPSK ��ȣ
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%���̵� ��� �� ������ ���� %%%%%%%%%%%%%%%%%%%%%%%%
        hA=sqrt(1/2)*(randn+j*randn); % ���׳� A�� ���̵� ���
        hB=sqrt(1/2)*(randn+j*randn); % ���׳� B�� ���̵� ���
        hC=sqrt(1/2)*(randn+j*randn); % ���׳� C�� ���̵� ���
        n1=sqrt(N0/2)*(randn+j*randn); % T1������ ���� ������
        n2=sqrt(N0/2)*(randn+j*randn); % T2������ ���� ������
        n3=sqrt(N0/2)*(randn+j*randn); % T3������ ���� ������
        n4=sqrt(N0/2)*(randn+j*randn); % T4������ ���� ������
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%% step 2. Alamouti coding�� ���� ��ȣ ����%%%%%%%%%%%
        r1=s1*hA+s2*hB+s3*hC+n1; % T1 ���� ���Ž�ȣ
        r2=-conj(s2)*hA+conj(s1)*hB+n2; % T2 ���� ���Ž�ȣ
        r3=conj(s3)*hA-conj(s1)*hC+n3; % T3 ���� ���Ž�ȣ
        r4=conj(s3)*hB-conj(s2)*hC+n4; % T4 ���� ���Ž�ȣ
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%ML decoding %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%% step 3. ��� ������ (s1, s2) ���� ���� %%
        s1_s2_s3_set=[[1,1,1];[1,1,-1];[1,-1,1];[1,-1,-1];[-1,1,1];[-1,1,-1];[-1,-1,1];[-1,-1,-1];];
        % BPSK ��ȣ���� ��� ������ s1, s2, s3 �� ����
        N_set=8; % �� ���� ��
        %%%%%% step 4. �� �ֿ� ���Ͽ� �ش� ���� ���´ٰ� ���� ���� �� ���� ��ȣ r1, r2, r3, r4 ����, ���� ����
        %%%%% ��ȣ (r1, r2, r3, r4)���� ED�� ���
        for k_set=1:N_set
            s1trial=s1_s2_s3_set(k_set,1); % s1trial �� ����.
            s2trial=s1_s2_s3_set(k_set,2); % s2trial �� ����.
            s3trial=s1_s2_s3_set(k_set,3); % s3trial �� ����.
            r1trial=s1trial*hA+s2trial*hB+s3trial*hC; % �ش� ���� ���´ٰ� ���� ���� �� ���Ž�ȣ
            r2trial=-conj(s2trial)*hA+conj(s1trial)*hB; % �ش� ���� ���´ٰ� ���� ���� �� ���Ž�ȣ
            r3trial=conj(s3trial)*hA-conj(s1trial)*hC; % �ش� ���� ���´ٰ� ���� ���� �� ���Ž�ȣ
            r4trial=conj(s3trial)*hB-conj(s2trial)*hC; % �ش� ���� ���´ٰ� ���� ���� �� ���Ž�ȣ
            distance(k_set)=sum(abs([r1, r2, r3, r4]-[r1trial, r2trial, r3trial, r4trial]).^2);
            % ���� ���� ��ȣ���� ��Ŭ���� ���
        end
        %%%%%%%%%%% step 5. ��� ���߿��� ED�� ���� ���� ���� ���� �ɺ� ������ �Ǵ� %%%%
        [A B]= min(distance); % distance �� ���� ���� ������ �ε����� B�� ����
        s1_hat=s1_s2_s3_set(B,1); % ���� ���� �Ÿ��� �ش��ϴ� s1
        s2_hat=s1_s2_s3_set(B,2); % ���� ���� �Ÿ��� �ش��ϴ� s2
        s3_hat=s1_s2_s3_set(B,3); % ���� ���� �Ÿ��� �ش��ϴ� s3
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if(s1_hat~=s1) % ������ ���� ��ȣ s1�� ���� ���Ž�ȣs1�� �ٸ� ���
            errcnt=errcnt+1; % ���� �� 1 ����.
        end
        if(s2_hat~=s2) % ������ ���� ��ȣ s2�� ���� ���� ��ȣ s2�� �ٸ� ���
            errcnt=errcnt+1; % ���� �� 1 ����.
        end
        if(s3_hat~=s3) % ������ ���� ��ȣ s3�� ���� ���Ž�ȣs3�� �ٸ� ���
            errcnt=errcnt+1; % ���� �� 1 ����.
        end
        symcnt=symcnt+3; % ��� �ɹ�(��Ʈ)�� ���Ͽ� ����üũ�� �����ߴ���?
    end
    BER(snri)=errcnt/symcnt % BER = ���� �� / �� �ɹ� ��
    save alamouti_ML_STBC_BER.mat EbN0dB_vector BER
end
figure % �׷��� â ���
semilogy( EbN0dB_vector, BER); % EbN0dB_vector�� ���� BER �׷��� ���
grid % ���� ǥ��
