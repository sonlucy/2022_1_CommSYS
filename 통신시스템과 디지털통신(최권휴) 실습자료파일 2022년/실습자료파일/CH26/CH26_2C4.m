clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
Nc=16;T=10e-5;
f_delta=1/T;
t_step=T/Nc;
t_vector=0:t_step:(T-t_step) % or t_vector=t_step*(0:Nc-1)

for k=0:(Nc-1)
    k_th_subcarrier=1/sqrt(T)*exp(j*2*pi*k*f_delta*t_vector);
    subcarrier_matrix(k+1,:)=k_th_subcarrier;
    %OFDM�������� ����ϱ����� ����ĳ������� subcarrier_matrix�� ���� ������� ����.
end

s_vector=sign(rand(1,Nc)-0.5)+j*sign(rand(1,Nc)-0.5);
%Nc ���� QPSK �ɹ�

xt=zeros(1,length(t_vector));
for k=0:(Nc-1)
    s_k=s_vector(k+1);
    k_th_subcarrier=subcarrier_matrix(k+1,:);
    xt=xt+  ?*k_th_subcarrier ; % (�� 26.2) ����
end
xt
