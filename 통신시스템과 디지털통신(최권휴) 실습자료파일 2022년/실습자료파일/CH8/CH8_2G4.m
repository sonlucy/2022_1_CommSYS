clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
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
randn(1,225); %XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
td=2+2*rand;
delayed_pt = circshift( pt', round(td/t_step) )' ;
nt=randn(1,length(delayed_pt));
bt= delayed_pt+nt;
figure(4)
plot(t, bt);axis([-5 5 -5 5]);
save mydelay.mat td 
clear td delayed_pt 

tau_vector=[];
rpb_vector=[];
for tau=-4:0.001:4
    tau_vector=[tau_vector tau];
    shift_samples=round(tau/t_step);
    bt_tau= circshift(bt', -shift_samples)';
    rpb_tau=sum(conj(pt).*bt_tau)*t_step;
    rpb_vector=[rpb_vector rpb_tau];
end
figure(7)
plot(tau_vector, rpb_vector); axis([-4 4 -0.07 0.07]);grid on;




