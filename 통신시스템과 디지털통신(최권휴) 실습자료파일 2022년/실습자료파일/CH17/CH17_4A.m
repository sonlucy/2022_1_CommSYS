clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
Ts=1;
tstep=Ts/10000;
tvector=0:tstep:Ts;

Delta_f=1/Ts;
f1=Delta_f;
f2=2*Delta_f;
f3=3*Delta_f;

x2t=cos(2*pi*f2*tvector);
E2=sum((x2t.^2)*tstep);
p2t=x2t/sqrt(E2);

x1t=cos(2*pi*f1*tvector);
E1=sum(x1t.^2)*tstep;
p1t=x1t/sqrt(E1);
% 신호 샘플 벡터 p3t 생성 (= 세번째 정규직교 신호의 샘플 벡터 )
x3t=cos(2*pi*f3*tvector);
E3=sum(x3t.^2)*tstep;
p3t=x3t/sqrt(E3);


% 신호 샘플 벡터 p1t 생성(= 첫번째 정규직교 신호의 샘플 벡터).
x1t=cos(2*pi*f1*tvector);
E1=sum(x1t.^2)*tstep;
p1t=x1t/sqrt(E1);
% 신호 샘플 벡터 p3t 생성(= 세번째 정규직교 신호의 샘플 벡터).
x3t=cos(2*pi*f3*tvector);
E3=sum(x3t.^2)*tstep;
P3t=x3t/sqrt(E3);
 
% s1t(=s1(t)의 샘플 벡터), s2t, ..., s8t 생성
% 예를 들어, 벡터 s1t는 아래와 같이 생성
s1t=-2*p1t -1*p2t +5*p3t;
s2t=1*p1t-2*p2t-3*p3t;
s3t=0.5*p1t +4*p2t +2*p3t;
s4t=3*p1t -1*p2t -1*p3t;
s5t=-1*p1t -4*p2t +3*p3t;
s6t=1*p1t +3*p2t -0.5*p3t;
s7t=-1*p1t -6*p2t +3*p3t;
s8t=-2*p1t -3*p2t +1*p3t;

