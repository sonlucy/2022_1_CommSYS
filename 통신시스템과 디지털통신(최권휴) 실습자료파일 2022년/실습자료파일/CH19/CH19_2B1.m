
S_ID=rand(1,225); % XXX= �ڽ��� �й��� 3�ڸ��� ��, 0 ���� �����Ͽ��� �������. �й��� ���� �Ϻ� ���� ����� �ٸ��� ������ ���̴� �ݵ�� �߰��Ұ�.
load st_and_rt.mat

data_bits_hat=[];    %������ ��Ʈ�� �����ϱ� ���� ���� �ʱ�ȭ
for n=1:Ns
    rt_nth= rt( ((n-1)*L+1) :  n*L  ); %n ��° M-ary ���Ž�ȣ ����
    
    C_rt_nth_s1t=sum(rt_nth.*s1t)*tstep; %���Ž�ȣ�� s1t�� ������� ��ġ�������� ���
    C_rt_nth_s2t=sum(rt_nth.*s2t)*tstep;
    C_rt_nth_s3t=sum(rt_nth.*s3t)*tstep;
    C_rt_nth_s4t=sum(rt_nth.*s4t)*tstep;
    
    [T1 T2]=max([C_rt_nth_s1t,C_rt_nth_s2t,C_rt_nth_s3t,C_rt_nth_s4t ]); % M-ary ��ȣ �� ���Ž�ȣ�� ������� ���� ���� ��ȣ�� ã��
    
    if T2==1
        twobits_hat= [0 0]  % <ǥ 18.1>�� �����Ͽ� ������ M-ary ��ȣ�� ���� �����͸� ����
    elseif T2==2
        twobits_hat= [0 1] 
    elseif T2==3
        twobits_hat= [1 0] 
    else
        twobits_hat= [1 1] 
    end
    
    data_bits_hat=[data_bits_hat  twobits_hat]; % ����� ��Ʈ�� ��Ʈ���� ����
end
