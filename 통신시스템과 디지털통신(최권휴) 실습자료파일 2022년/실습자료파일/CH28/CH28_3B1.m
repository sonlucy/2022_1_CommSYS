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
        r2=?;     %T2 ���� ���Ž�ȣ
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %%%%%%Simple linear combining for decoding!!!!%%%%%%%%
        z1= ?; % s1�� �Ǻ�����
        z2= ?; % s2�� �Ǻ�����
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
