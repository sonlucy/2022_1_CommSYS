clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
N=3;
T=8.XXX ; % XXX는 학번 뒤 세자리

t1=0;
t2=T;
t_step=1e-3;
t=t1:t_step:t2;
ft=(t.^3).*exp(-t).*cos(t) ;

w0=2*pi/(t2-t1); % 이 문제에서는, w0= 2*pi/T로 두어도 무방함.

ft_approx=zeros(1, length(t));
for n=-N:N
    nth_exp=exp(j*n*w0*t);
    f_n=(sum(ft.*conj(nth_exp))*t_step)/(sum(nth_exp.*conj(nth_exp))*t_step);%or (sum(ft.*conj(nth_exp))*t_step)/T
    ft_approx = ft_approx + f_n*nth_exp;
end

figure
plot(t, ft)
hold on
plot(t, ft_approx, 'r')
legend('ft' , 'ft_{approx}')
