clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
tau_step=0.01;
tau=-5:tau_step:5;
f1mirror=0.5*((tau>-1)&(tau<0));
plot(tau,f1mirror); axis([-5 5 -5 5]);grid on; 
