clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
EsN0=  ;  %Es/N0, ���ϴ� ������ ����
s1=  ;    % ������Ŀ� ���� ������ �ɹ� �����ϰ� �߻�

Es=2*abs(s1)^2;

hA=sqrt(1/2)*(randn+j*randn);
hB=sqrt(1/2)*(randn+j*randn);
n=sqrt(N0/2)*(randn+j*randn);
sA=s1; % ���׳� A�� �۽� ��ȣ
sB=s1; % ���׳� B�� �۽� ��ȣ
r=hA*sA+hB*sB+n;

