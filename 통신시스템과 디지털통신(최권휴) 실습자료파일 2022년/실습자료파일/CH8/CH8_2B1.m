clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
t_step=0.001;
t=-5:t_step:5;
tmp=(0<t) & (t<0.05);
figure(1)
plot(t,tmp); title('tmp');axis([-5 5 -2 2]);
tone=sin(2*pi*50*t);
psint=tone.*tmp;
figure(2)
plot(t,psint); title('sine pulse');axis([-5 5 -2 2]);grid on;
pt=sign(psint);
figure(3)
plot(t,pt); title('pt');axis([-5 5 -2 2]);grid on;
randn(1,225); %XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.

td=2+2*rand;  %td�� 2~4 ������ �Ǽ��� �������� ������.
delayed_pt = circshift( pt', round(td/t_step) )' ; %td/t_step�� �ݿø��� ����ŭ  pt�� ��Ҹ� ��ȯ������ �̵� 
                                                   %����, p(t-td)
nt=randn(1,length(delayed_pt)); % "1 x p(t-td)����" �� ũ�⸦ ���� ����� n(t)�� ��ȯ
bt= delayed_pt+nt; % b(t)= p(t-td) + n(t)
figure(4)
plot(t, bt);axis([-5 5 -5 5]);  %x���� t��, t�� ���� �Լ� bt�� x��� y�� ������ (-5,5)�� �ؼ� �׷��� �׸�����

save mydelay.mat td %����� ������� �κ�, �׷��� �� �߰� �� ��.
clear td delayed_pt %�ڵ�� ������� �κ�, �׷��� �� �߰� �� ��.


