clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
N=30;
load song.mat;
t_step=1/44100;
sample_num=50;
T=t_step*sample_num; % T= 50�� ���õ����� �ð�
t=0:t_step:T-t_step;
interval=(1:sample_num)+sample_num*5; % f(t)�� ����, X�� �й� ���ڸ�
ft=data(2,interval) ; % ������ȣ f(t)�� interval ������ ���� ����
f1=1/(2*T);
ft_approx= zeros(1, length(t)); %��t���� ���̰� ������ 0���� ����.
for n=1:N
    snt=sin(2*pi*n*f1*t); 
    f_n=(sum(ft.*conj(snt))*t_step)/(sum(snt.*conj(snt))*t_step);
    ft_approx = ft_approx + f_n * snt ; 
end
figure
plot(t, ft)
hold on
plot(t, ft_approx, 'r')
legend( 'ft', 'ft_{approx}' )
title('�й����ڸ� 9�� ������, N=30')
