clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
figure 
ID=[1,6,0,1,2,9,2,5]; 
t0= 90 ; 
for trial=1:50000 % 50000=>PC 속도에 따라 조절가능 단, 작을수록 오차 증가
    %xt=conv(randn(1,100), ID)+4.35; 
    xt= conv(randn(1,100), ID);
    xt_at_t0(trial)=xt(t0);
end
mean(xt_at_t0)
hist(xt_at_t0,100)
