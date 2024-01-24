%tx_sig_gen.m
clear
rand(1,1517); % XXX= the last three digits of your student ID. Irrelavent to the goal of this m-file but mandatory.
Ts=1;
L=16;
t_step=Ts/L;
%%%%%%%%%< Pulse waveform generation > %%%%%%%%%%%%%%%%%%%%%%
pt=rcosine(1,L,'normal',1);

%%%%%%%%%< Ns 4-ary PAM generation>%%%%%%%%%%%%%%%%%%%%
Ns=1517;
amp_modulated=2*ceil(rand(1,Ns)*4)-5;

%%%%%%%%%< Impulse modulation >%%%%%%%%%%%%%%%%%%%%%%%%%%%%
impulse_modulated=[];
for n=1:Ns
    delta_signal= [amp_modulated(n)  zeros(1, L-1)];
    impulse_modulated=[impulse_modulated  delta_signal];
end

%%%%%%%%<Pulse shaping (Transmitter filtering)>%%%%%%%%%%
tx_signal=conv(impulse_modulated, pt);

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


figure(200)
for k=2:floor(Ns/3)   % k는 몇 번째 조각인지를 나타내는 인덱스.
    
    tmp=tx_signal(  ((k-1)*3*L+1)  :  (k*3*L)  ); % k번째 3심벌 구간. 문제 2.C1 답 참조.
    plot(t_step*(0:(3*L-1)), tmp);
    
    axis([0  3 min(tx_signal) max(tx_signal)]);
    grid on; hold on

end
hold off


