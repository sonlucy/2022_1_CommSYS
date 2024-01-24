% s5(t)와 s8(t)를 선택한 경우의 예
clear 
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
T=8.XXX ; %XXX는 학번 뒤 세자리
t_step=1e-3;
t=0:t_step:T;
f1=1/(2*T); % s1(t)의 주파수 

s5t=sin(2*pi*f1*5*t); % s5(t) 의 샘플 벡터 
s8t=?; % s8(t)의 샘플 벡터

InnerProduct=sum(s5t.*conj(?))*? 
%내적 공식을 수치 적분으로 구현
