clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
Nid=1225; %XXX = �ڽ��� �й� �� 3�ڸ�
for n=1:Nid
    X1=sqrt(2)*randn+1 ;
    X2=sqrt(9)*randn-2 ;
    X3=sqrt(4)*randn+0 ;
    Y(n)= X1+3*X2-2*X3 ;
end
mY=sum(Y)/Nid %14���� 5.A ����, ��Ʈ���� Smean()s �Լ��� ������� �� ��.
vY=(sum(Y.^2)/Nid) -mY^2 %14���� 5.B ����, ��Ʈ���� svar()u �Լ��� ������� �� ��.
