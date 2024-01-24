clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
%%%Signal pulse design %%%%%%%%%%%%%%%%%%%%%%%%%%%
Ts=1; L=16;
t_step=Ts/L;
pt=rcosine(1,L,'sqrt',0.5); N=length(pt);
% Roll-off factor=0.5�� ��square root raised cosine���� �޽��� ���. ��rcosine()�� �Լ� ������ 20���� ���� 1.D�� ����

%%% Signal(BPSK �� ��� ��Ʈ) Energy ��� %%%%%%%%%%%%%%%%%%%%%%% 
Eb=sum(pt.^2)*t_step ;   

%%%% ���⼭���� N0 ���� part %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
EbN0dB=100; % �ϴ� Eb/N0 = 100dB�� �־����� ����.

EbN0=10^(EbN0dB/10); %�Ʒ� ����2. dB�� Linear ������ ȯ���ϴ� ��. �־��� EbN0dB�� ���� �ٲ�� EbN0 �� ���� �ٲ� �� �ֵ��� EbN0dB�� �� �Լ������� �ϼ��� ��
N0= Eb/EbN0dB ; % Eb�� EbN0�� �̿��� ����. ����, ���� EbN0dB �� ���� �ٲ���� N0�� ���� �ٲ�� �ֵ��� Eb, EbN0�� �� �Լ������� �ϼ��� ��

v_n=N0/(2*t_step); %1.D


%%%%%%%%%<2. 100 bit (binary symbol) generation>%%%%%%%%%%%%%%%%%%%%
Ns=100;
data_bit=(rand(1,Ns)>0.5);

%%%%%%%%%<3. Unipolar to Bipolar (amplitude modulation)>%%%%%%%%%%%%%%
amp_modulated=2*data_bit-1; % 0=> -1,  1=>1  % binary ��ȣ
%amp_modulated=2*ceil(rand(1,Ns)*4)-5;  %4-ary PAM �۽� ��ȣ

%%%%%%%%%<4. Impulse modulation >%%%%%%%%%%%%%%%%%%%%%%%%%%%%
impulse_modulated=[];
for n=1:Ns
    delta_signal= [amp_modulated(n)  zeros(1, L-1)];
    impulse_modulated=[impulse_modulated  delta_signal];
end

%%%%%%%%<5.Pulse shaping (Transmitter filtering)>%%%%%%%%%%
tx_signal=conv(impulse_modulated, pt);  %transmitting filter ���. impulse response�� �������

%%%%%%%%<Noise sample �߻�>%%%%%%%%%%%%%%%
n_samples=sqrt(v_n)*randn(1,length(tx_signal)); %n[k] ����

%%%%%%%%%%%%<���Ž�ȣ���� �߻�>%%%%%%%%%%%%%
r_samples=tx_signal +n_samples;


z_samples= conv(r_samples, pt);



%{
figure
subplot(2,1,1)
stem(impulse_modulated(1:20*L),'.');
grid on
subplot(2,1,2)
plot(z_samples(1:20*L));
grid on

estimated_data_bit(1)=(z_samples(N+(n-1)*L)>0);
estimated_data_bit(2)=(z_samples(N+(n-1)*L)>0);
estimated_data_bit(3)=(z_samples(N+(n-1)*L)>0);
estimated_data_bit(4)=(z_samples(N+(n-1)*L)>0);
estimated_data_bit(5)=(z_samples(N+(n-1)*L)>0);
%}
