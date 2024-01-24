clear
S_ID=rand(1,225); % XXX= �ڽ��� �й��� 3�ڸ��� ��, 0 ���� �����Ͽ��� �������. �й��� ���� �Ϻ� ���� ����� �ٸ��� ������ ���̴� �ݵ�� �߰��Ұ�.
load st_and_rt.mat
data_bits_hat=[]; %������ ��Ʈ�� �����ϱ� ���� ���� �ʱ�ȭ
for n=1:Ns
    rt_nth= rt( ((n-1)*L+1) : n*L ); %n ��° M-ary ���Ž�ȣ ����
    
    E_rt_s1t=sum(abs(rt_nth-s1t).^2)*tstep; % rt_nth�� s1t�� �������� ��ġ����
    E_rt_s2t=sum(abs(rt_nth-s2t).^2)*tstep;
    E_rt_s3t=sum(abs(rt_nth-s3t).^2)*tstep;
    E_rt_s4t=sum(abs(rt_nth-s4t).^2)*tstep;
 
    
    
    [T1 T2]=min([E_rt_s1t,E_rt_s2t,E_rt_s3t,E_rt_s4t]);
    
    if T2==1
        twobits_hat= [0 0] ;
    elseif T2==2
        twobits_hat= [0 1];
    elseif T2==3
        twobits_hat= [1 0];
    else
        twobits_hat= [1 1];
    end
    
    data_bits_hat=[data_bits_hat  twobits_hat]; % ����� ��Ʈ�� ��Ʈ���� ����
end
