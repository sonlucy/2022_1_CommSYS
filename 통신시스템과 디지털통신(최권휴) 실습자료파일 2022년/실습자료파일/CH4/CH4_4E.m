clear
randn(1,225); % XXX=학번 끝 세자리=225
load sampled_ft.mat 
t_step= t_vector(2) - t_vector(1); %샘플간격 설정

Fw_vector=[];
w_vector=[];
for w=-25000:50:25000 %-25000에서 50 간격으로 25000까지 증가
    
    Fw=sum(ft_vector.*exp(-j*w*t_vector))*t_step; %수치적분법 사용해 F(w) 구하기.
    
    w_vector=[w_vector w];  %각각의 w 원소들을 담는 w_vector
    Fw_vector=[Fw_vector Fw]; %계산한 Fw를 순서대로 담는 Fw_vector
    
end  %for문 종료
plot(w_vector,abs(Fw_vector)) %x축 w_vector, y축 절댓값 Fw_vector로 그래프
xlabel('Frequency [rad/sec]') %x축 라벨 설정
grid
