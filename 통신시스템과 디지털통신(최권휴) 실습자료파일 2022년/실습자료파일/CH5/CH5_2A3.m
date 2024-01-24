clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
tau_step=0.01;
tau=-5:tau_step:5;
f1mirror=0.5*((tau>-1)&(tau<0));
figure

a=-1;
delay_samples=round(a/(tau_step));
f1mirror_delayed=circshift(f1mirror',delay_samples)';
subplot(7,1,1)
plot(tau,f1mirror_delayed); axis([-5 5 -0.5 1]);grid on;

a=-0.5;
delay_samples=round(a/(tau_step));
f1mirror_delayed=circshift(f1mirror', delay_samples)';
subplot(7,1,2)
plot(tau,f1mirror_delayed); axis([-5 5 -0.5 1]);grid on;

% a=0, 0.5, 1, 2.5, 3 인 경우에 대해 반복하는 코드를 채울 것
...
...