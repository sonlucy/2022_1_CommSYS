%Save this file as QAM_BER_sim.m
clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
EbN0dB_vector=2:2:12;   
Eb=2.5; %���� 1.B5 �� ��
t_step=1/100; % ��16QAM_AWGN�� ����� ��out1�� ����� ���� ���� (������ ���� ���ݰ� ����)
for n=1:length(EbN0dB_vector)
    EbN0dB=EbN0dB_vector(n);
    EbN0=  ?;   % dB ���� linear ������(21�� 1.A ���� ����)
    N0=Eb/EbN0;  % N0�� ���
    v_n= ?;      % variance ����(�� 23.2 ����)
    sim('QAM_BER')  % ������ QAM_BER.mdl/slx ������ ����
    BER_vector(n)=ErrorVec(1) % workspace�� BER�� ���ͷ� �����.
end
figure
semilogy(EbN0dB_vector, BER_vector ) % Eb/N0[dB]�� ���� BER �� �׸���
hold on;
BER_theory=berawgn(EbN0dB_vector,'qam',16,'gray'); 
semilogy(EbN0dB_vector, BER_theory,'r')
xlabel('Eb/N0 [dB]');ylabel('BER');legend('Simulated','Theory');grid on; hold off