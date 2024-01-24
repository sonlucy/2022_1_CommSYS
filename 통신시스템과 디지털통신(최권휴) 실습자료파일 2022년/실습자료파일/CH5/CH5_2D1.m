clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
tau_step=0.01;
tau=-5:tau_step:5; % �ܺ���� ���н��� ���� ������ -�Ŀ��� ���ε�, ���б����� -5���� 5�� �ϴ� ������ �ּ����� ���ÿ�.
f2= ((tau>-1)&(tau<0)) -((tau>0)&(tau<1)) ;
f1mirror=0.5*((tau>-1)&(tau<0));

t=0.2;
delay_samples=round(t/tau_step);
f1mirror_delayed=circshift(f1mirror', delay_samples)';

sum(f2.*f1mirror_delayed)*tau_step
