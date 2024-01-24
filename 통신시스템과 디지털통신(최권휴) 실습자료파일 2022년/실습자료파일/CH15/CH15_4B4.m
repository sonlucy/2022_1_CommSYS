clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
figure(1)
ID=[2,2,0,1,2,2,2,5]; % �ڽ��� �й� �� �ڸ����� ���� ����
t1= 59 ;  

R_vector=[];   %R���� ���� �� �ʱ�ȭ
tau_vector=[];  %tau���� ���� �� �ʱ�ȭ
for tau= (-t1+1):(-t1+100) % for-loop
    t2=t1+tau;  % tau= t2-t1. t1�� t2�� ���̰� tau
    for trial=1:10000 % '1 ~ 10000' for-loop
        xt=randn(1,100);
        %xt=conv(randn(1,100), ID)+4.35; %100���� ���Ҹ� ���� ���� ���� ���� �� ID�� ���������.
                                        %�ű⿡ 4.35�� ���� �� ���� xt�� ����.
        xt1_mult_xt2(trial)=xt(t1)*xt(t2); %t1������ x(t)�� t2������ x(t)�� ��������� ����
                                           %xt1_mult_xt2�� ������. �ݺ��� ���� 10000����
                                           %���� �������·� �����. 
    end 
    tau_vector=[tau_vector tau]; %tau���Ϳ� tau �߰�
    R_at_tau= mean(xt1_mult_xt2); %xt1_mult_xt2�� ����� R_at_tau ������ ����
    R_vector=[R_vector R_at_tau]; %R���Ϳ� R_at_tau �߰�
end %end for-loop
plot(tau_vector,R_vector); %tau����(x��)�� ���� R���� �׷��� �׸���
axis([-50 50 min(R_vector) max(R_vector)]); %x���� '-50~50'������, y���� R������ �ּ�~�ִ밪���� �����ϸ�
hold on
xlabel('tau')
grid on
