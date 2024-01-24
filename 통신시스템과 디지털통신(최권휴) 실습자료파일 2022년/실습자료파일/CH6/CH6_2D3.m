clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
B=2000; %�뿪��, ���� 2 KHz�� ����
td=0.02; %�����ð�
t_step=1/8192;
t=0:t_step:0.04;

ht=2*B*sinc(2*B*(t-td)); % (�� 2.4)

Hw_vector=[];
w_vector=[];
for w=-20000:10:20000
    w_vector=[w_vector w];
    Hw=sum(?.*exp(-j*w*?))*t_step;
    Hw_vector=[Hw_vector Hw];
end

figure
subplot(3,1,1)
plot(t,ht);xlabel('t [sec]');ylabel('h(t)');grid
subplot(3,1,2)
plot(w_vector,abs(Hw_vector))
xlabel('w [rad/sec]');ylabel('|H(w)|');grid
subplot(3,1,3)
plot(w_vector,angle(Hw_vector));
xlabel('w [rad/sec]');ylabel('\angle H(w)');grid;axis([-50 50 -1 1])
