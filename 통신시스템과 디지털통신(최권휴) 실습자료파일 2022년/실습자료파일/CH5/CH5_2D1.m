clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
tau_step=0.01;
tau=-5:tau_step:5; % 콘볼루션 적분식은 적분 구간이 -∞에서 ∞인데, 적분구간을 -5에서 5로 하는 이유를 주석으로 쓰시오.
f2= ((tau>-1)&(tau<0)) -((tau>0)&(tau<1)) ;
f1mirror=0.5*((tau>-1)&(tau<0));

t=0.2;
delay_samples=round(t/tau_step);
f1mirror_delayed=circshift(f1mirror', delay_samples)';

sum(f2.*f1mirror_delayed)*tau_step
