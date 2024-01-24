clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
B=200;
td=0.02
t=0:(1/8192):2*td;  
ht=2*B*sinc(2*B*(t-td));
plot(t,ht);
grid
