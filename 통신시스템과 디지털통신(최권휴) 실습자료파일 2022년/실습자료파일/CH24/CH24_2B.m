clear
rand(1,1XXX); % XXX=�ڽ��� �й� �� 3 �ڸ�. �ڵ�� ������� ���������� �ݵ�� ������ ��.
Nb=4;
m=rand(1,Nb)>0.5; 
coded_m=enc(m);
s=2*coded_m-1; 
r=s+randn(1,length(s)); 

% 2.A�� m-file�� �Ʒ� �߰�
m_set(1,:)=[0,0,0,0];  
m_set(2,:)=[0,0,0,1];  
m_set(3,:)=[0,0,1,0];  
....   % ��� ������ 4��Ʈ�� ���� ���� ��m_set�� ����. ������ ä�� ��.
m_set(16,:)=[1,1,1,1];

for k=1:16
   m_k=m_set(k,:);
   coded_m_k=enc(m_k);
   s_k=2*coded_m_k-1;
   D_k(k)=sum((r-s_k).^2 ); % QPSK ���� ���Һ������ sum(abs(r-s_k).^2 )�� ���
end
D_k % Step 3.

