randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
Ts=1;
tstep=Ts/10000; %수치적분 위한 샘플링 간격
tvector=0:tstep:Ts; %시작부 0에서부터 tstep 간격으로 Ts까지를 tvector에 벡터로 저장

Delta_f=1/Ts; %주파수는 주기의 역수 관계
f2=2*Delta_f; %주파수간격에 2를 곱하여 두번째(n=2) 주파수를 f2에 저장

x2t=cos(2*pi*f2*tvector); %x_2(t)함수 식
E2=sum(x2t.^2)*tstep; %신호의 에너지 공식 적용. 수치적분(2장의 문제 1 참조)
p2t=x2t/sqrt(E2); % 기저벡터 식 적용. 첫번째 정규직교 신호의 샘플 벡터


