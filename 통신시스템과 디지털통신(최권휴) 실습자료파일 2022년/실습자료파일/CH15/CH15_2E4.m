clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
Nid=1225; % XXX= �ڽ��� �й� �� 3�ڸ�
cnt=0;
Trials=0;
while cnt < Nid
    X1=sqrt(2)*randn+1 ;
    X2=sqrt(9)*randn-2 ;
    X3=sqrt(4)*randn+0 ;
    Y= X1+ 3*X2-2*X3 ;
    if Y >= 5
        cnt=cnt+1;
    end
    Trials=Trials+1;
end
P=cnt/Trials
