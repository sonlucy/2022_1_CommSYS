clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
x=0:0.1:(10+�й� ���ڸ�);
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
