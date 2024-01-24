clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
a=3;
b=12;
xstep=0.01;
x=a:xstep:b;
y=2*x.*exp(-2*x);
S=sum(y)*xstep