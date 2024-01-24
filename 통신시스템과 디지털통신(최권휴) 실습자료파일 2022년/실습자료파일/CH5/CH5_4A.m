clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
tstep=0.01;
t=-5:tstep:5;
f1=0.5*((t>0)&(t<1));
f2= ((t>-1)&(t<0)) -((t>0)&(t<1));

Fw1=[];
Fw2=[];
w_vector=[];
w_step=2*pi*0.01;
for w=(2*pi*?):w_step:(2*pi*?) % 주파수 단위가 rad/sec임을 유의할 것.
    
    Fw1_at_w=sum(f1.*exp(-j*w*t))*tstep;
    Fw2_at_w=?;
    
    w_vector=[w_vector w];
    
    Fw1=[Fw1  Fw1_at_w];
    Fw2=[Fw2  Fw2_at_w];
end
save Fw1_Fw2.mat Fw1 Fw2 
figure(1)
subplot(2,1,1)
plot(w_vector, abs(Fw1)) % f1(t)의 진폭 스펙트럼
subplot(2,1,2)
plot(w_vector, angle(Fw1)) % f1(t)의 위상 스펙트럼
figure(2)
subplot(2,1,1)
plot(w_vector, abs(?))% f2(t)의 진폭 스펙트럼
subplot(2,1,2)
plot(w_vector, angle(?)) % f2(t)의 위상 스펙트럼

