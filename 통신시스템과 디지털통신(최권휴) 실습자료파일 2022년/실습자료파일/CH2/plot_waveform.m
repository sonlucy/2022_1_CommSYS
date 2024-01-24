clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
N=5;
load song.mat;
t_step=1/44100;
sample_num=50;
T=t_step*sample_num; % T= 50개 샘플동안의 시간
t=0:t_step:T-t_step;
interval=(1:sample_num)+sample_num*X; % f(t)의 구간, X는 학번 끝자리
ft=data(2,interval) ; % 음성신호 f(t)의 interval 구간의 샘플 벡터
f1=1/(2*T);
figure
subplot(N+1,1,1);
plot(t, ft)
grid on
for n=1:N
    snt=sin(2*pi*n*f1*t);  
    subplot(N+1,1,n+1);
    plot(t, snt, 'r')
    grid on
end

