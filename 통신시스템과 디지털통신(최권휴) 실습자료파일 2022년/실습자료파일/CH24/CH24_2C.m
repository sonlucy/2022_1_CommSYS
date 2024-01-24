clear
rand(1,1XXX); % XXX=자신의 학번 뒤 3자리. 코드와 상관없는 내용이지만 반드시 실행할 것.
Nb=4;
m=rand(1, Nb)>0.5;
coded_m=enc(m);
s=2*coded_m-1; 
r=s+randn(1,length(s)); 
z=(r>0);
m_set(1,:)=[0,0,0,0];
....
m_set(16,:)=[1,1,1,1];

for k=1:16
   m_k=m_set(k,:);
   coded_m_k=enc(m_k);
   s_k=2*coded_m_k-1;
   %D_k(k)=sum((r-s_k).^2 ); %연판정을 위한 부분
   D_k(k)=sum(xor(z,coded_m_k));  %경판정을 위한 부분
end

[T1 T2]=min(D_k);
m_hat=m_set(?,:);
dec_err=sum(m~=m_hat) 
