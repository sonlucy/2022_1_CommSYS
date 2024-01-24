clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
x_step=0.01;
x=-5:x_step:5;
Px=1/sqrt(2*pi)*exp( -((x+3).^2)/(2*1));
plot(x,Px);

