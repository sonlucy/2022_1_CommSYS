clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
%%%Signal pulse design %%%%%%%%%%%%%%%%%%%%%%%%%%%
Ts=1; L=16;
t_step=Ts/L;
pt=rcosine(1,L,'sqrt',0.5); N=length(pt);
% Roll-off factor=0.5인 ‘square root raised cosine’을 펄스를 고려. ‘rcosine()’ 함수 사용법은 20장의 문제 1.D를 참조

%%% Signal(BPSK 인 경우 비트) Energy 계산 %%%%%%%%%%%%%%%%%%%%%%% 
Eb=sum(pt.^2)*t_step ;   

%%%% 여기서부터 N0 세팅 part %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
EbN0dB=100; % 일단 Eb/N0 = 100dB로 주어졌다 가정.

EbN0=10^(EbN0dB/10); %아래 참고2. dB를 Linear 값으로 환산하는 식. 주어진 EbN0dB가 추후 바뀌면 EbN0 가 따라서 바뀔 수 있도록 EbN0dB가 들어간 함수식으로 완성할 것
N0= Eb/EbN0dB ; % Eb와 EbN0를 이용한 계산식. 역시, 위의 EbN0dB 가 추후 바뀌더라도 N0가 따라서 바뀔수 있도록 Eb, EbN0가 들어간 함수식으로 완성할 것

v_n=N0/(2*t_step); %1.D


%%%%%%%%%<2. 100 bit (binary symbol) generation>%%%%%%%%%%%%%%%%%%%%
Ns=100;
data_bit=(rand(1,Ns)>0.5);

%%%%%%%%%<3. Unipolar to Bipolar (amplitude modulation)>%%%%%%%%%%%%%%
amp_modulated=2*data_bit-1; % 0=> -1,  1=>1  % binary 신호
%amp_modulated=2*ceil(rand(1,Ns)*4)-5;  %4-ary PAM 송신 신호

%%%%%%%%%<4. Impulse modulation >%%%%%%%%%%%%%%%%%%%%%%%%%%%%
impulse_modulated=[];
for n=1:Ns
    delta_signal= [amp_modulated(n)  zeros(1, L-1)];
    impulse_modulated=[impulse_modulated  delta_signal];
end

%%%%%%%%<5.Pulse shaping (Transmitter filtering)>%%%%%%%%%%
tx_signal=conv(impulse_modulated, pt);  %transmitting filter 통과. impulse response와 컨볼루션

%%%%%%%%<Noise sample 발생>%%%%%%%%%%%%%%%
n_samples=sqrt(v_n)*randn(1,length(tx_signal)); %n[k] 생성

%%%%%%%%%%%%<수신신호샘플 발생>%%%%%%%%%%%%%
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
