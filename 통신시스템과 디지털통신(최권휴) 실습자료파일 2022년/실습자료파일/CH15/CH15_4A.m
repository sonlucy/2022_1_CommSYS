clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
figure 
ID=[2,2,0,1,2,2,2,5];% �ڽ��� �й� �� �ڸ����� ��ü�� ��.
for trial=1:100
xt=conv(randn(1,100),ID)+4.35; % xt����. ��������(�캯)�� ���� ����.
  plot(xt)
  xlabel('t [sec]')
  pause
end
