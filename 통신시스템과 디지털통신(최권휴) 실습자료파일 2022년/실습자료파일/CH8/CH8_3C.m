clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
t_step=0.001;
t=-5:t_step:5;
tmp=(0<t) & (t<0.05);
figure(1)
plot(t,tmp); title('tmp');axis([-5 5 -2 2]);
tone=sin(2*pi*50*t);
psint=tone.*tmp;
figure(2)
plot(t,psint); title('sine pulse');axis([-5 5 -2 2]);grid on;
pt=sign(psint);
figure(3)
plot(t,pt); title('pt');axis([-5 5 -2 2]);grid on;
randn(1,XXX); %XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
td=2+2*rand;
delayed_pt = circshift( pt', round(td/t_step) )' ;
nt=randn(1,length(delayed_pt));
bt= delayed_pt+nt;
figure(4)
plot(t, bt);axis([-5 5 -5 5]);
save mydelay.mat td 
clear td delayed_pt 

tau_vector=[];
rp_vector=[];
for tau=-4:0.001:4
    tau_vector=[tau_vector tau];
    shift_samples=round(tau/t_step);
    pt_tau=circshift(pt', -shift_samples)';
    rp_tau=sum(conj(pt).*pt_tau)*t_step;
    rp_vector=[rp_vector rp_tau];
end
figure(5)
plot(tau_vector, rp_vector)

f_vector=[]; P_vector=[];
for f=0:3:500
    f_vector=[f_vector f];
    P_f=sum(pt.*exp(-j*2*pi*f*t))*0.001; 
    P_vector=[P_vector P_f]; 
end
figure(9)
plot(f_vector,abs(P_vector).^2) 
grid on
xlabel('frequency [Hz]')


