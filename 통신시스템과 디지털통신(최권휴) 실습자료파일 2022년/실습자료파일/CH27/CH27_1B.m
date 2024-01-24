clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
L=5; max_delay=1e-6; decay_base=1e-6; t_step=1e-8;
ht=ht_mp_ch(max_delay,L,decay_base,t_step);

ht4plot=[ht zeros(1,1024-length(ht))] 

figure(1)
subplot(2,1,1);
stem((0:1023)*t_step,abs(ht4plot), '.');
title('Multipath magnitude profile(=|h_{mp}(t)|)');xlabel('time [sec]');
axis([-100*t_step 1023*t_step 0 1]);grid on

subplot(2,1,2);
plot((0:1023)/1023/t_step,abs(fft(ht4plot)));
title('Channel response in frequency domain (=|H_{MP}(f)|)');xlabel('frequency [Hz]');
axis([0 1/t_step 0 max(abs(fft(ht4plot))+0.2)]);grid on
