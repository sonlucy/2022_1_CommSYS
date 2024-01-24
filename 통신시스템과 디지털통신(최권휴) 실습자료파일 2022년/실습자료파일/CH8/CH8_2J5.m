clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
load rt_sampled.mat

t_step=0.001;
Rr_vector=[];
tau_vector=[];
for tau=-4:0.01:4
    tau_vector=[tau_vector tau];
    shift_samples=round(tau/t_step);
    rt_tau=circshift(rt', -shift_samples)';
    Rr_tau=1/20*sum(conj(rt).*rt_tau)*t_step;
    Rr_vector=[Rr_vector Rr_tau];
end
figure
plot(tau_vector, Rr_vector);grid on;
