clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
EbN0dB_vector=[0 3 6 9 12 15]; % EbN0 ���� dB ������ ����.
Eb=2; %BPSK(1 �Ǵ� -1)�ɹ��� �� �ɹ� �ֱ⿡ ���� �����Ƿ�(ǥ 28.3 ����)

for snri=1:length(EbN0dB_vector)
    EbN0dB=EbN0dB_vector(snri);
    EbN0=10^(EbN0dB/10); 
    N0=Eb/EbN0; 
    errcnt=0; symcnt=0;
    while errcnt<500 
        s1=sign(rand-0.5);
        s2=sign(rand-0.5);
        
        %%%���̵� ��� �� ������ ���� %%%%%%%%%%%%%
        hA=sqrt(1/2)*(randn+j*randn);
        hB=sqrt(1/2)*(randn+j*randn);
        n1=sqrt(N0/2)*(randn+j*randn);  %T1������ ���� ������
        n2=sqrt(N0/2)*(randn+j*randn);  %T2������ ���� ������
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %%%%%Alamouti coding�� ���� ��ȣ ����%%%%%%%%%%%
        r1=hA*s1+hB*s2+n1;  %T1 ���� ���Ž�ȣ
        r2=?;             %T2 ���� ���Ž�ȣ
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %%%%%%ML decoding %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        s1s2pairCandidate=[[1,1];[1,-1];[-1,1];[-1,-1]];
        N_set=4; %Number of candidates
        for k_set=1:N_set
            s1candidate=s1s2pairCandidate(k_set,1);
            s2candidate=s1s2pairCandidate(k_set,?);
            r1candidate=hA*s1candidate+hB*s2candidate;  
            % s1�� s1candidate�̰� s2�� s2candidate���ٴ� ���� �Ͽ�r1candidate�� ������ ��. n1,n2�� ���� ��.
            % ����,������� �� ��հ��� 0���� ����.
            r2candidate=? ;
            
            distance(k_set)=sum(abs([r1, r2]-[r1candidate,r2candidate]).^2);
        end
        [A B]= min( ? );
        s1_hat=s1s2pairCandidate(B,1); 
        s2_hat=s1s2pairCandidate(B,2); 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        if(s1_hat~=s1)
            errcnt=errcnt+1;
        end
        if(s2_hat~=s2)
            errcnt=errcnt+1;
        end
        symcnt=symcnt + 2;
    end
    
    BER(snri)=errcnt/symcnt;
    save alamouti_ML_BER.mat EbN0dB_vector BER
end
figure
semilogy( EbN0dB_vector, BER);
title('Alamouti coded, BPSK, Rayleigh fading');
xlabel('Eb/N0 [dB');ylabel('BER');
grid on