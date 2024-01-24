%tx_sig_gen.m
clear
rand(1,1225); % XXX= �ڽ��� �й� �� 3�ڸ�. �ڵ�� ������� �κ������� �ݵ�� �߰��� ��.
Ts=1;
L=16;
t_step=Ts/L;
%%%%%%%%%< Pulse waveform generation > %%%%%%%%%%%%%%%%%%%%%%
pt=rcosine(1,L,'sqrt',0.5);


%%%%%%%%%< Binary symbol stream generation>%%%%%%%%%%%%%%%%%%%%
Ns=1517;
data_bit=(rand(1,Ns)>0.5);
%%%%%%%%%< Unipolar to Bipolar (amplitude modulation)>%%%%%%%%%%%%%%
%amp_modulated=2*data_bit-1; % 0=> -1,  1=>1


%%%%%%%%%< 4-ary symbol stream generation>%%%%%%%%%%%%%%%%%%%%
amp_modulated=2*ceil(rand(1,Ns)*4)-5;

%%%%%%%%%< Impulse modulation >%%%%%%%%%%%%%%%%%%%%%%%%%%%%
impulse_modulated=[];
for n=1:Ns
    delta_signal= [amp_modulated(n)  zeros(1, L-1)];
    impulse_modulated=[impulse_modulated  delta_signal];
end

%%%%%%%%<Pulse shaping (Transmitter filtering)>%%%%%%%%%%
tx_signal=conv(impulse_modulated, pt);
matched_out=conv(tx_signal, pt)

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
for k=3:floor(Ns/3)    % k�� �� ��° ���������� ��Ÿ���� �ε���.
    
    tmp=tx_signal(  ((k-1)*3*L+1)  :  (k*3*L)  ); % k��° 3�ɹ� ����. ���� 2.C1 �� ����.
    plot(t_step*(0:(3*L-1)), tmp);
    
    axis([0  3 min(tx_signal) max(tx_signal)]);
    grid on; hold on

end
hold off
grid on

figure(300) 
pwelch(matched_out(1:L*500), L*8, [ ], 2048,16);
axis([0  1 -10 15])
hold on


