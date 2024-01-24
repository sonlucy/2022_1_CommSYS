clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
x=0:0.1:(10+학번 끝자리);
for n=1:8
    a=n/10;
    if (a==0.2)
        a=0.25;
    end
    y(n,:)=x.*sin(a*x);
end
plot(x,y)
xlabel('x')
ylabel('y=x sin(ax)')
legend('a=0,1','a=0.25','a=0.3','a=0.4','a=0.5','a=0.6','a=0.7','a=0.8')
grid on
