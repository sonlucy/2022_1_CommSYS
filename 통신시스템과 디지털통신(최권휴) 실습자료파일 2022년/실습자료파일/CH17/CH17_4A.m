clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
Ts=1;
tstep=Ts/10000;
tvector=0:tstep:Ts;

Delta_f=1/Ts;
f1=Delta_f;
f2=2*Delta_f;
f3=3*Delta_f;

x2t=cos(2*pi*f2*tvector);
E2=sum((x2t.^2)*tstep);
p2t=x2t/sqrt(E2);

x1t=cos(2*pi*f1*tvector);
E1=sum(x1t.^2)*tstep;
p1t=x1t/sqrt(E1);
% ��ȣ ���� ���� p3t ���� (= ����° �������� ��ȣ�� ���� ���� )
x3t=cos(2*pi*f3*tvector);
E3=sum(x3t.^2)*tstep;
p3t=x3t/sqrt(E3);


% ��ȣ ���� ���� p1t ����(= ù��° �������� ��ȣ�� ���� ����).
x1t=cos(2*pi*f1*tvector);
E1=sum(x1t.^2)*tstep;
p1t=x1t/sqrt(E1);
% ��ȣ ���� ���� p3t ����(= ����° �������� ��ȣ�� ���� ����).
x3t=cos(2*pi*f3*tvector);
E3=sum(x3t.^2)*tstep;
P3t=x3t/sqrt(E3);
 
% s1t(=s1(t)�� ���� ����), s2t, ..., s8t ����
% ���� ���, ���� s1t�� �Ʒ��� ���� ����
s1t=-2*p1t -1*p2t +5*p3t;
s2t=1*p1t-2*p2t-3*p3t;
s3t=0.5*p1t +4*p2t +2*p3t;
s4t=3*p1t -1*p2t -1*p3t;
s5t=-1*p1t -4*p2t +3*p3t;
s6t=1*p1t +3*p2t -0.5*p3t;
s7t=-1*p1t -6*p2t +3*p3t;
s8t=-2*p1t -3*p2t +1*p3t;

