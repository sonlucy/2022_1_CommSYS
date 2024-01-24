clear;
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
t=0:0.01:5;
x=(1<=t)&(t<=2);
x2=sin(2*pi*5*t+pi/3);
y=x.*x2;
plot(t, y); axis([-1 6 -2 2])
