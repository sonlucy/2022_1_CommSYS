clear
S_ID=rand(1,XXX); % XXX= �ڽ��� �й��� 3�ڸ��� ��, 0 ���� �����Ͽ��� �������. �й��� ���� �Ϻ� ���� ����� �ٸ��� ������ ���̴� �ݵ�� �߰��Ұ�.
load st_and_rt.mat

noise_sample= 2*randn(1,L*100000);   %AWGN
rt=noise_sample;   % ���� ������ �� �� ���� ��ȣ

z1s=[]; z2s=[]; z2when_z1inR1=[]; z2when_z1inR2=[];
for n=1:70000
    
    rt_nth= rt( ((n-1)*L+1): n*L ); %n��° M-ary �ɹ��Ⱓ�� ���Ž�ȣ ����
    
    z1=sum(rt_nth.*?)*tstep; % (�� 18.3)�� ���� ���Ž�ȣ�� ���Ͱ������� �� ������ ��ȯ
    z2=sum(rt_nth.*?)*tstep; % (�� 18.3)�� ���� ���Ž�ȣ�� ���Ͱ������� �� ������ ��ȯ
    
    if 0<=z1 && z1<=0.1
        z2when_z1inR1=[z2when_z1inR1 z2]; % z1�� R1 ������ ���Ե� ��, z2�� ����
    end
    
    if 0.2<=z1 && z1<=0.3
        z2when_z1inR2=[z2when_z1inR2 z2]; % z1�� R2 ������ ���Ե� ��, z2�� ����
    end
    
    z1s=[z1s z1]; z2s=[z2s z2];
end
