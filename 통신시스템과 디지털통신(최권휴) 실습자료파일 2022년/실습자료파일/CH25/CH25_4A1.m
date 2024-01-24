clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
EbN0dB_vector=0:3:15;
Eb=1;
L=3;
for snr_i=1:length(EbN0dB_vector)
    EbN0dB=EbN0dB_vector(snr_i);
    EbN0=10.^(EbN0dB/10);
    N0=Eb/EbN0;
    sym_cnt=0;
    err_cnt=0;
    while err_cnt<100 % �ѿ�������(����100)�� �����ϸ� ��Ȯ�� ����,�ð� ����.
        b=sign(rand-0.5);  %BPSK symbol {1,-1}
        s=sqrt(Eb/L)*b;
        for k=1:L
            h(k)=sqrt(1/2)*(randn+j*randn);
            n(k)=sqrt(N0/2)*(randn+j*randn);
            r(k)=?*s+?;
        end
        
        [T1 T2]=max(?); % �Ʒ�����
        D=r(?)*exp(-j*angle(h(?))); 
        
        b_hat=sign(real(D));
        if b_hat~=b;
            err_cnt=err_cnt+1;
        end
        sym_cnt=sym_cnt+1;
    end
    BER(snr_i)=err_cnt/sym_cnt
end
figure
semilogy(EbN0dB_vector, BER)
xlabel('E_b/N_0 [dB]')
ylabel('BER')
grid
