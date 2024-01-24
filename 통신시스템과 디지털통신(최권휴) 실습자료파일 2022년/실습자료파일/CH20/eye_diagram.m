%tx_sig_gen.m
clear
rand(1,1XXX); % XXX= 자신의 학번 뒤 3자리. 코드와 상관없는 부분이지만 반드시 추가할 것
Ts=1;
L=16;
t_step=Ts/L;
%%%%%%%%%<1. Pulse waveform generation > %%%%%%%%%%%%%%%%%%%%%%
pt=rcosine(1,L,'normal', 0.25);

%%%%%%%%%<2. 100 bit (binary symbol) generation>%%%%%%%%%%%%%%%%%%%%
Ns=10000;
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

%%%%%%%%%%%%%%%%%%% 심벌 Clock 생성 %%%%%%%%%%%%%%%%%%%%
clk=[];
for di=1:ceil(length(tx_signal)/(L/2))
    clk=[clk (-1)^di*ones(1,L/2)];
end
clk=clk(1:length(tx_signal)); %clk의 길이와 tx_signal 길이 맞춤.

%%%%%% 심벌 Clock과 Pulse 성형된 파형을 오디오 신호로 출력 %%%%%%%%%%%%%
signal_out_nth=[clk' tx_signal']';
X=? ; % X = 자신의 학번 끝자리 수
signal_out=[];
for k=1:(X+1)
    signal_out=[signal_out signal_out_nth] ;
end
soundsc(signal_out',4000*(X+2));

