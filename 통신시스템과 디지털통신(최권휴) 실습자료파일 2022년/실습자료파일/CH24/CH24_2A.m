clear
rand(1,1XXX); % XXX=�ڽ��� �й� �� 3 �ڸ�. �ڵ�� ������� ���������� �ݵ�� ������ ��.
Nb=4;
m=rand(1,Nb)>0.5; 
coded_m=enc(m);
s=2*coded_m-1; 
r=s+randn(1,length(s)); 
