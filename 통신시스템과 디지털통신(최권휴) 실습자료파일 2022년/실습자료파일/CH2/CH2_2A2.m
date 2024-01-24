clear 
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
T=8.XXX; % XXX는 학번 뒤 세자리
t_step=1e-3;
t=0:t_step:T;
f1=1/(2*T); % s1(t)의 주파수 
s1t=sin(2*pi*f1*t); % s1(t)의 샘플 벡터 
s2t=sin(2*pi*(2*f1)*t); % s2(t) 샘플 벡터  
E1=sum(abs(s1t).^2)*t_step % 에너지 공식을 수치적분으로 구현
E2=?
