clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
tau_step=0.01;
tau=-5:tau_step:5;
f1mirror=1/tau_step*(tau==0);
f2= ((tau>-1)&(tau<0)) -((tau>0)&(tau<1)) ;
t_vector=[];
f2convf1=[];
for t=-5:0.05:5
   
    delay_samples=round(t/tau_step);
    f1mirror_delayed=circshift(f1mirror', delay_samples)';
    f2convf1_at_t=sum(f2.*f1mirror_delayed)*tau_step;
     
    t_vector=[t_vector t]; 
    f2convf1=[f2convf1  f2convf1_at_t];

end
figure
plot(t_vector, f2convf1); grid on
