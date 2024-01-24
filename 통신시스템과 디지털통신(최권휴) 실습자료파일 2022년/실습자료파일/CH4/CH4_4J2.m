clear
randn(1,225); % XXX=학번 끝 세자리=225
load sampled_ft.mat %파일 로드 
t_step= t_vector(2) - t_vector(1); %스텝간격 설정
L=length(ft_vector); %ft_vector의 길이를 L로 설정
diff_out=(ft_vector(2:L)-ft_vector(1:(L-1)))/t_step; %df(t)/dt에 대한 샘플벡터로 근사화
t_vector=t_vector(1:(L-1)); %‘diff_out’의 길이는 L이 아니라 L-1 이므로 ‘t_vector’에 저장된 마지막 샘플링 시점을 제거함

Dw_vector=[];
w_vector=[];
for w=-25000:50:25000 %-25000에서 50간격으로 25000까지 증가
    w_vector=[w_vector w]; %각각의 w 원소들을 담는 w_vector
    
    Dw=sum(diff_out.*exp(-j*w*t_vector))*t_step; %푸리어 변환 공식을 수치적분으로 구함.
    Dw_vector=[Dw_vector Dw]; %Dw_vector에 계산한 각 Dw 담기
end
plot(w_vector,abs(Dw_vector)); %x축 w_vector, y축 절댓값 Dw_vector로 그래프
xlabel('Frequency [rad/sec]'); %x축 라벨 설정
grid  
