clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
N=3;
T=8.XXX ; % XXX�� �й� �� ���ڸ�

t1=0;
t2=T;
t_step=1e-3;
t=t1:t_step:t2;
ft=(t.^3).*exp(-t).*cos(t) ;

w0=2*pi/(t2-t1); % �� ����������, w0= 2*pi/T�� �ξ ������.

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
