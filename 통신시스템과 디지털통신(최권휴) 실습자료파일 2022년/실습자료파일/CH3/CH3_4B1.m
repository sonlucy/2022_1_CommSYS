clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
R=0.5e3;
C=1XXXe-6; % XXX�� �ڽ��� �й� �� 3�ڸ�
t=0:(1/1000):20;
T=2;
w0=(2*pi)/?;
gt_approx=0;
for n=-100:100
    if mod(n,2)==0
        Fn=0; %  (�� 3.4)
    else
        Fn=2/?; %  (�� 3.4)
    end
    w=n*w0;
    Hw=1/(1+j*R*C*w);
    Gn=Hw*?; % ���� 4.A4
    gt_approx=gt_approx + Gn*exp(j*n*w0*t);
end
figure
plot(t,gt_approx);
grid
