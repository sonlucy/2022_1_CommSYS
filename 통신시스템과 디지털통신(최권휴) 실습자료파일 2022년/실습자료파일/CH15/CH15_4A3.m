clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
figure 
ID=[1,6,0,1,2,9,2,5]; 
t0= 90 ; 
for trial=1:50000 % 50000=>PC �ӵ��� ���� �������� ��, �������� ���� ����
    %xt=conv(randn(1,100), ID)+4.35; 
    xt= conv(randn(1,100), ID);
    xt_at_t0(trial)=xt(t0);
end
mean(xt_at_t0)
hist(xt_at_t0,100)
