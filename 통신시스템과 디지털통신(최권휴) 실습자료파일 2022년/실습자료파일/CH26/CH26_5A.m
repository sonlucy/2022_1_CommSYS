clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
Nf=10;
Nc=16;T=10e-5;
f_delta=1/T;
t_step=T/Nc;
t_vector=0:t_step:(T-t_step); 
for k=0:(Nc-1)
    subcarrier=1/sqrt(T)*exp(j*2*pi*k*f_delta*t_vector);
    subcarrier_matrix(k+1,:)=subcarrier;    
    %OFDM�������� ����ϱ� ���� ����ĳ������� subcarrier_matrix�� ���� ����.
end
xt_frame=[];
for m=1:Nf
    s_vector=sign(rand(1,Nc)-0.5)+j*sign(rand(1,Nc)-0.5);
    
    xt=zeros(1,length(t_vector));
    for k=0:(Nc-1)
        s_k=s_vector(k+1);
        xt=xt+s_k*subcarrier_matrix(k+1,:);
    end
    xt_frame=[xt_frame xt];
end
