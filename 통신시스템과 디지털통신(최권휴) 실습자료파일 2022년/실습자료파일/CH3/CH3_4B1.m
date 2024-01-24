clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
R=0.5e3;
C=1XXXe-6; % XXX는 자신의 학번 뒤 3자리
t=0:(1/1000):20;
T=2;
w0=(2*pi)/?;
gt_approx=0;
for n=-100:100
    if mod(n,2)==0
        Fn=0; %  (식 3.4)
    else
        Fn=2/?; %  (식 3.4)
    end
    w=n*w0;
    Hw=1/(1+j*R*C*w);
    Gn=Hw*?; % 문제 4.A4
    gt_approx=gt_approx + Gn*exp(j*n*w0*t);
end
figure
plot(t,gt_approx);
grid
