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
