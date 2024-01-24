%tx_sig_gen.m
clear
rand(1,225); % XXX= 학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
Ts=1;
L=16;
t_step=Ts/L;
%%%%%%%%%<1. Pulse waveform generation > %%%%%%%%%%%%%%%%%%%%%%
pt=rcosine(1,L,'sqrt', 0.5);
%pt=rcosdesign(0.25, 1 ,L,'normal');

%%%%%%%%%<2. 100 bit (binary symbol) generation>%%%%%%%%%%%%%%%%%%%%
Ns=1225;
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
tx_signal=conv(impulse_modulated, pt);
matched_out=conv(tx_signal,pt);  %%%%%%%%%% 3.B



figure(100)
subplot(2,1,1)
stem(t_step:t_step:(Ns*Ts), impulse_modulated,'.');
axis([0  Ns*Ts  -2*max(impulse_modulated)  2*max(impulse_modulated)]);
grid on
title('impulse modulated')
subplot(2,1,2)
plot(t_step:t_step:(t_step*length(tx_signal)), tx_signal);
axis([0  Ns*Ts -2*max(tx_signal) 2*max(tx_signal)]);
grid on
title('pulse shaped') 

