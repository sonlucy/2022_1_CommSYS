clear
rand(1225); % XXX=자신의 학번 뒤 3자리. m-file 내용과 상관없으나 반드시 추가할 것.
Ts=1;
tstep=Ts/10000;
tvector=0:tstep:Ts;

rt=cos(1.532*tvector*pi ); % (식 17.3) 또는 (식 17.7)

Delta_f=1/Ts;
f1=Delta_f;
f2=2*Delta_f;
f3=3*Delta_f;

x1t=cos(2*pi*f1*tvector);
E1=sum(x1t.^2)*tstep;
p1t=x1t/sqrt(E1);

x2t=cos(2*pi*f2*tvector);
E2=sum(x2t.^2)*tstep;  % 수치적분(2장의 1 참조)
p2t=x2t/sqrt(E2); % 두번째 정규직교 신호의 샘플 벡터

% 신호 샘플 벡터 p3t 생성 (= 세번째 정규직교 신호의 샘플 벡터 )
x3t=cos(2*pi*f3*tvector);
E3=sum(x3t.^2)*tstep;
p3t=x3t/sqrt(E3);

s1t=-2*p1t -1*p2t +5*p3t;
s2t=1*p1t -2*p2t -3*p3t;
s3t=-2*p1t -1*p2t +5*p3t;
s4t=-2*p1t -1*p2t +5*p3t;
s5t=-2*p1t -1*p2t +5*p3t;
s6t=-2*p1t -1*p2t +5*p3t;
s7t=-2*p1t -1*p2t +5*p3t;
s8t=-2*p1t -1*p2t +5*p3t;

% (식 17.4)에서 구한 각 8-ary 신호의 벡터 공간 좌표 생성.
s1t_in_vector_space=[-2,-1,5];  %=s1
s2t_in_vector_space=[1,-2,-3];
s3t_in_vector_space=[0.5,4,2];
s4t_in_vector_space=[3,-1,-1];
s5t_in_vector_space=[-1,-4,3];
s6t_in_vector_space=[1,3,-0.5];
s7t_in_vector_space=[-1,-6,3];
s8t_in_vector_space=[-2,-3,1]; 

res1=sum(rt.*s1t)*tstep
res2=sum(rt.*s2t)*tstep


