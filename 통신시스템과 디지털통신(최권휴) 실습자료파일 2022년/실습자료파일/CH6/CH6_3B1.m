clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
load handel
rand(1, 2225); % XXXX= �й� �� 4�ڸ�, �ڵ�� ������� �κ������� �� �߰��� ��.
f=3250+500*rand;
tone=sin(2*pi*f*(1:length(y))*1/Fs);
xt=y'+ tone; 
pwelch(xt,[],[],[],Fs)
clear f;
