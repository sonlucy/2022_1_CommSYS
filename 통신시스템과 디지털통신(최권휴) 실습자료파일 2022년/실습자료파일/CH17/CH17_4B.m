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

% 신호 샘플 벡터 p1t 생성(= 첫번째 정규직교 신호의 샘플 벡터).
x1t=cos(2*pi*f1*tvector);
E1=sum(x1t.^2)*tstep;
p1t=x1t/sqrt(E1);
% 신호 샘플 벡터 p3t 생성 (= 세번째 정규직교 신호의 샘플 벡터 )
x3t=cos(2*pi*f3*tvector);
E3=sum(x3t.^2)*tstep;
p3t=x3t/sqrt(E3);
 
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

% 4.A의 m-file의 마지막에 아래 코드를 추가할 것.
%rt=cos(1.532*tvector*pi ); % (식 17.3) 또는 (식 17.7)
rt=cos(4.53*tvector*pi );

E_rt_s1t= sum(abs(rt-s1t).^2)*tstep;  % 차이 에너지를 수치적분으로 구현
E_rt_s2t= sum(abs(rt-s2t).^2)*tstep ; 
E_rt_s3t= sum(abs(rt-s3t).^2)*tstep ; 
E_rt_s4t= sum(abs(rt-s4t).^2)*tstep ; 
E_rt_s5t= sum(abs(rt-s5t).^2)*tstep ; 
E_rt_s6t= sum(abs(rt-s6t).^2)*tstep ; 
E_rt_s7t= sum(abs(rt-s7t).^2)*tstep ; 
E_rt_s8t= sum(abs(rt-s8t).^2)*tstep ; 


% 문제 2.C4에서 수행한 계산을 매트랩으로 구현. m-file 코딩이 익숙하지 않으면 계산된 8개의 거리를 바탕으로 직접 구하여 판별하여도 무방함.
[T1 T2]=min([E_rt_s1t, E_rt_s2t, E_rt_s3t, E_rt_s4t, E_rt_s5t, E_rt_s6t, E_rt_s7t, E_rt_s8t]);


T2
