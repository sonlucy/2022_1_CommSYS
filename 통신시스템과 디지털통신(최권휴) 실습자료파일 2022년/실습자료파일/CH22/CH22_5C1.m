clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
Nerrs=50; %Simulation ���Ḧ ���� �� ��������. Nerrs ���� �������� ������ �������� ��������� Ŀ��.
EbN0dB_vector=[0 1 3 5 7];
Eb=16;t_step=1/256;
for n=1:length(EbN0dB_vector)
    EbN0dB=EbN0dB_vector(n);
    EbN0=10^(EbN0dB/10);   % dB ���� linear ������(���� 4.A �� ����)
    N0=Eb/EbN0;
    v_n=N0/(2*t_step);     % variance ����(���� 4.A �� ����)
    sim('QPSK_BER')  % ������ QPSK_BER.mdl/slx ������ ����
    BER_vector(n)=BER(1)
    %workspace�� ��µǴ� ���� ��BER���� (���� BER,������Ʈ��,�Ѻ�Ʈ��)%�� �������·� ��µǹǷ� ù ��° ���Ҹ� ����.
    BER_theory(n)=0.5*erfc(sqrt(EbN0));
end
figure
semilogy(EbN0dB_vector, BER_vector ) %Eb/N0[dB]�� ���� BER �� �׸���
hold on;
semilogy(EbN0dB_vector, BER_theory,'r')
xlabel('Eb/N0 [dB]');ylabel('BER');legend('Simulated','Theory');grid on; hold off


