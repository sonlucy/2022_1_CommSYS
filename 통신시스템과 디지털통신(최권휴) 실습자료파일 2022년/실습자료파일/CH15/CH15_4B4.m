clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
figure(1)
ID=[2,2,0,1,2,2,2,5]; % 자신의 학번 각 자리수로 만든 벡터
t1= 59 ;  

R_vector=[];   %R벡터 선언 및 초기화
tau_vector=[];  %tau벡터 선언 및 초기화
for tau= (-t1+1):(-t1+100) % for-loop
    t2=t1+tau;  % tau= t2-t1. t1과 t2의 차이가 tau
    for trial=1:10000 % '1 ~ 10000' for-loop
        xt=randn(1,100);
        %xt=conv(randn(1,100), ID)+4.35; %100개의 원소를 가진 랜덤 벡터 생성 후 ID와 컨볼루션함.
                                        %거기에 4.35를 더한 후 변수 xt에 저장.
        xt1_mult_xt2(trial)=xt(t1)*xt(t2); %t1에서의 x(t)와 t2에서의 x(t)를 컨볼루션한 값을
                                           %xt1_mult_xt2에 저장함. 반복문 통해 10000개의
                                           %값이 벡터형태로 저장됨. 
    end 
    tau_vector=[tau_vector tau]; %tau벡터에 tau 추가
    R_at_tau= mean(xt1_mult_xt2); %xt1_mult_xt2의 평균을 R_at_tau 변수에 저장
    R_vector=[R_vector R_at_tau]; %R벡터에 R_at_tau 추가
end %end for-loop
plot(tau_vector,R_vector); %tau벡터(x축)에 대해 R벡터 그래프 그리기
axis([-50 50 min(R_vector) max(R_vector)]); %x축은 '-50~50'범위로, y축은 R벡터의 최소~최대값으로 스케일링
hold on
xlabel('tau')
grid on
