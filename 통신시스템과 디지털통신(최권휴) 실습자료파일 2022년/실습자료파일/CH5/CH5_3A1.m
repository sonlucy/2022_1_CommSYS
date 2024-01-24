clear
randn(1,225); % XXX=학번 끝 세자리=225
t_step=0.01;
t=-5:t_step:5;
f1=1/t_step*(t==0);
figure
plot(t, f1); axis([-5 5 -5 10]);grid on


