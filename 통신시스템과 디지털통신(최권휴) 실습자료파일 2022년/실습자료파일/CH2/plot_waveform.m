clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
N=5;
load song.mat;
t_step=1/44100;
sample_num=50;
T=t_step*sample_num; % T= 50�� ���õ����� �ð�
t=0:t_step:T-t_step;
interval=(1:sample_num)+sample_num*X; % f(t)�� ����, X�� �й� ���ڸ�
ft=data(2,interval) ; % ������ȣ f(t)�� interval ������ ���� ����
f1=1/(2*T);
figure
subplot(N+1,1,1);
plot(t, ft)
grid on
for n=1:N
    snt=sin(2*pi*n*f1*t);  
    subplot(N+1,1,n+1);
    plot(t, snt, 'r')
    grid on
end

