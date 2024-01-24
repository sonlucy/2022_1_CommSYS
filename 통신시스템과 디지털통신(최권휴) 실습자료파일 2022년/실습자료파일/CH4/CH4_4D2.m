clear
randn(1,225); % XXX=학번 끝 세자리 ==225
load sampled_ft.mat 
t_step= t_vector(2) - t_vector(1); %샘플간격

Fw30=sum(ft_vector.*exp(-j*30*t_vector))*t_step 
% 위 라인은 w=30에서 푸리에 변환 F(w) 즉, F(30)을 수치적분(2장 문제 1 참조)으로 구현한 것
Fw70=sum(ft_vector.*exp(-j*70*t_vector))*t_step 
% 위 라인은 w=70에서 푸리에 변환 F(w) 즉, F(70)을 수치적분(2장 문제 1 참조)으로 구현한 것
Fw200=sum(ft_vector.*exp(-j*200*t_vector))*t_step 
% 위 라인은 w=200에서 푸리에 변환 F(w) 즉, F(200)을 수치적분(2장 문제 1 참조)으로 구현한 것