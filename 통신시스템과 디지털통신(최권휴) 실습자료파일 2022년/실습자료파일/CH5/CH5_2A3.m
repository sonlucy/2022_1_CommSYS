clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
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

% a=0, 0.5, 1, 2.5, 3 �� ��쿡 ���� �ݺ��ϴ� �ڵ带 ä�� ��
...
...