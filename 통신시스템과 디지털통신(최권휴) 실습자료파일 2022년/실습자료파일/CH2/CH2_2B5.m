clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
N=30;
load song.mat;
t_step=1/44100;
sample_num=50;
T=t_step*sample_num; % T= 50개 샘플동안의 시간
t=0:t_step:T-t_step;
interval=(1:sample_num)+sample_num*5; % f(t)의 구간, X는 학번 끝자리
ft=data(2,interval) ; % 음성신호 f(t)의 interval 구간의 샘플 벡터
f1=1/(2*T);
ft_approx= zeros(1, length(t)); %‘t’와 길이가 동일한 0벡터 생성.
for n=1:N
    snt=sin(2*pi*n*f1*t); 
    f_n=(sum(ft.*conj(snt))*t_step)/(sum(snt.*conj(snt))*t_step);
    ft_approx = ft_approx + f_n * snt ; 
end
figure
plot(t, ft)
hold on
plot(t, ft_approx, 'r')
legend( 'ft', 'ft_{approx}' )
title('학번끝자리 9로 했을때, N=30')
