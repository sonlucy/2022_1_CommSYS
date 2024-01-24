clear
rand(1,1XXX); % XXX=자신의 학번 뒤 3 자리. 코드와 상관없는 내용이지만 반드시 포함할 것.
Nb=4;
m=rand(1,Nb)>0.5; 
coded_m=enc(m);
s=2*coded_m-1; 
r=s+randn(1,length(s)); 
