clear
rand(1225); % XXX=자신의 학번 뒤 3자리. m-file 내용과 상관없으나 반드시 추가할 것.
Ts=1;
tstep=Ts/10000;
tvector=0:tstep:Ts;

Delta_f=1/Ts;
f1=Delta_f;
f2=2*Delta_f;
f3=3*Delta_f;

x2t=cos(2*pi*f2*tvector);
E2=sum(x2t.^2)*tstep;  % 수치적분(2장의 1 참조)
p2t=x2t/sqrt(E2); % 두번째 정규직교 신호의 샘플 벡터

% 신호 샘플 벡터 p1t 생성 (= 첫번째 정규직교 신호의 샘플 벡터 )
x1t=cos(2*pi*f1*tvector);
E1=sum(x1t.^2)*tstep;
p1t=x1t/sqrt(E1);
% 신호 샘플 벡터 p3t 생성 (= 세번째 정규직교 신호의 샘플 벡터 )
x3t=cos(2*pi*f3*tvector);
E3=sum(x3t.^2)*tstep;
p3t=x3t/sqrt(E3);

rt=cos(1.532*tvector*pi ); % (식 17.3) 또는 (식 17.7)

% (식 17.4)에서 구한 각 8-ary 신호의 벡터 공간 좌표 생성.
s1t_in_vector_space=[-2,-1,5];  %=s1
s2t_in_vector_space=[1,-2,-3];
s3t_in_vector_space=[0.5,4,2];
s4t_in_vector_space=[3,-1,-1];
s5t_in_vector_space=[-1,-4,3];
s6t_in_vector_space=[1,3,-0.5];
s7t_in_vector_space=[-1,-6,3];
s8t_in_vector_space=[-2,-3,1]; 

%식(17.6)에 나타낸 적분 계산을 수치적분(2장의 1 참조)으로 구현.
Z1=sum(rt.*p1t)*tstep;
Z2=sum(rt.*p2t)*tstep;
Z3=sum(rt.*p3t)*tstep;
rt_in_vector_space=[Z1,Z2,Z3];  % = (식 17.5)의 Z

% 문제 2.C3에서 수행한 계산을 매트랩으로 구현. m-file 작성이 익숙하지 않으면 command window에서 거리를 하나씩 계산하여도 무방함.
ED_rt_s1t=sum(abs(rt_in_vector_space  -  s1t_in_vector_space ).^2); % 벡터공간에서 rt와 s1t의 유클리드 거리의 제곱
ED_rt_s2t=sum(abs(rt_in_vector_space- s2t_in_vector_space).^2);
ED_rt_s3t=sum(abs(rt_in_vector_space- s3t_in_vector_space).^2);
ED_rt_s4t=sum(abs(rt_in_vector_space- s4t_in_vector_space).^2);
ED_rt_s5t=sum(abs(rt_in_vector_space- s5t_in_vector_space).^2);
ED_rt_s6t=sum(abs(rt_in_vector_space- s6t_in_vector_space).^2);
ED_rt_s7t=sum(abs(rt_in_vector_space- s7t_in_vector_space).^2);
ED_rt_s8t=sum(abs(rt_in_vector_space- s8t_in_vector_space).^2);

% 문제 2.C4에서 수행한 계산을 매트랩으로 구현. m-file 코딩이 익숙하지 않으면 계산된 8개의 거리를 바탕으로 직접 구하여 판별하여도 무방함.
[T1 T2]=min([ED_rt_s1t, ED_rt_s2t, ED_rt_s3t, ED_rt_s4t, ED_rt_s5t, ED_rt_s6t, ED_rt_s7t, ED_rt_s8t]);
T2
