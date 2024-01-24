clear
rand(1,1XXX); % XXX=자신의 학번 뒤 3 자리. 코드와 상관없는 내용이지만 반드시 포함할 것.
Nb=4;
m=rand(1,Nb)>0.5; 
coded_m=enc(m);
s=2*coded_m-1; 
r=s+randn(1,length(s)); 

% 2.A의 m-file에 아래 추가
m_set(1,:)=[0,0,0,0];  
m_set(2,:)=[0,0,0,1];  
m_set(3,:)=[0,0,1,0];  
....   % 모든 가능한 4비트의 가설 집합 ‘m_set’ 생성. 적당히 채울 것.
m_set(16,:)=[1,1,1,1];

for k=1:16
   m_k=m_set(k,:);
   coded_m_k=enc(m_k);
   s_k=2*coded_m_k-1;
   D_k(k)=sum((r-s_k).^2 ); % QPSK 같은 복소변조라면 sum(abs(r-s_k).^2 )를 사용
end
D_k % Step 3.

