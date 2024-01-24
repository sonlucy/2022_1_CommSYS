clear
randn(1,225); % XXX=�й� �� ���ڸ�=225
load sampled_ft.mat %���� �ε� 
t_step= t_vector(2) - t_vector(1); %���ܰ��� ����
L=length(ft_vector); %ft_vector�� ���̸� L�� ����
diff_out=(ft_vector(2:L)-ft_vector(1:(L-1)))/t_step; %df(t)/dt�� ���� ���ú��ͷ� �ٻ�ȭ
t_vector=t_vector(1:(L-1)); %��diff_out���� ���̴� L�� �ƴ϶� L-1 �̹Ƿ� ��t_vector���� ����� ������ ���ø� ������ ������

Dw_vector=[];
w_vector=[];
for w=-25000:50:25000 %-25000���� 50�������� 25000���� ����
    w_vector=[w_vector w]; %������ w ���ҵ��� ��� w_vector
    
    Dw=sum(diff_out.*exp(-j*w*t_vector))*t_step; %Ǫ���� ��ȯ ������ ��ġ�������� ����.
    Dw_vector=[Dw_vector Dw]; %Dw_vector�� ����� �� Dw ���
end
plot(w_vector,abs(Dw_vector)); %x�� w_vector, y�� ���� Dw_vector�� �׷���
xlabel('Frequency [rad/sec]'); %x�� �� ����
grid  
