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
EbN0dB=9; % �ϴ� Eb/N0 = 100dB�� �־����� ����.

EbN0=10^(EbN0dB/10); %�Ʒ� ����2. dB�� Linear ������ ȯ���ϴ� ��. �־��� EbN0dB�� ���� �ٲ�� EbN0 �� ���� �ٲ� �� �ֵ��� EbN0dB�� �� �Լ������� �ϼ��� ��
N0= Eb/EbN0 ; % Eb�� EbN0�� �̿��� ����. ����, ���� EbN0dB �� ���� �ٲ���� N0�� ���� �ٲ�� �ֵ��� Eb, EbN0�� �� �Լ������� �ϼ��� ��

v_n=N0/(2*t_step);  %����������� �л� ���

sum_Ne=0;  % ��ü ���� �� �ʱ�ȭ
N_frame=0;  % ������ ������ ��

%for  frame_number=1:N_frame
while sum_Ne<25

    %%%%%%%%%<2. 100 bit (binary symbol) generation>%%%%%%%%%%%%%%%%%%%%
    Ns=100;
    data_bit=(rand(1,Ns)>0.5);
    
    %%%%%%%%%<3. Unipolar to Bipolar (amplitude modulation)>%%%%%%%%%%%%%%
    amp_modulated=2*data_bit-1; % 0=> -1,  1=>1
    
    %%%%%%%%%<4. Impulse modulation >%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    impulse_modulated=[];
    for n=1:Ns
        delta_signal= [amp_modulated(n)  zeros(1, L-1)];
        impulse_modulated=[impulse_modulated  delta_signal];
    end
    
    %%%%%%%%<5.Pulse shaping (Transmitter filtering)>%%%%%%%%%%
    tx_signal=conv(impulse_modulated, pt);
    
    %%%%%%<Noise sample �߻� >%%%%%%%%%%%%%%%%%%%%%
    n_samples=sqrt(v_n)*randn(1,length(tx_signal));%Generate n[k]
    
    %%%%%%<���� ��ȣ ���� �߻�>%%%%%%%%%%%%
    r_samples = tx_signal + n_samples;
    
    z_samples=conv(r_samples,pt);  %���� ���� (matched filtering
       
    
    estimated_data_bit= (z_samples(N+((1:Ns)-1)*L) >0 ); % ����2.H���� ������ �����ͺ�Ʈ ����
    
    %%%%%%%%%< Step 8�� �����ϱ� ���� ���� �߰��� �κ� >%%%%%%%%%%%
    Ne=sum(estimated_data_bit~=data_bit);  % �Ǻ��Ⱥ�Ʈ�� �۽ŵȺ�Ʈ�� ���ؼ� ���� ���� �ջ� (�� �����ӿ� ���Ͽ�)
    sum_Ne=sum_Ne +Ne;  %������ �����ӿ� ���� ���������� for���� ���� ��� �����ӿ� ���� �ջ��Ͽ� ����

    N_frame=N_frame+1;
end

% �Ʒ��� ������ BER ���, BER=��ü ��Ʈ ���� �߻� ����/���۵� ��ü ��Ʈ ��
Total_bit=N_frame*Ns;
BER=sum_Ne/Total_bit
