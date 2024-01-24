clear
randn(1,225); % XXX=학번 끝 세자리= 225
B=400;
t=-0.02:(1/8192):0.02;  
ht=2*B*sinc(2*B*t);
plot(t,ht);
xlabel('B=400');
grid
