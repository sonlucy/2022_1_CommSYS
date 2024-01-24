clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
tau_step=0.01;
tau=-5:tau_step:5;
f1mirror=0.5*((tau>=-1)&(tau<0));
f2= ((tau>=-1)&(tau<=0)) -((tau>=0)&(tau<=1)) ;

t_vector=[]; f2convf1=[];
w_vector=[]; Fourier_f2convf1=[];
tstep=0.05

for t=-3:tstep:4
    delay_samples=round(t/tau_step);
    f1mirror_delayed=circshift(f1mirror', delay_samples)';
    f2convf1_at_t=sum(f2.*f1mirror_delayed)*tau_step; % f2�� f1�� �ܺ����
    
    t_vector=[t_vector t];
    f2convf1=[f2convf1 f2convf1_at_t];
end

for w=(2*pi*-10):(2*pi*0.01):(2*pi*10)
    Fourier_f2convf1_at_w=sum(?.*exp(-j*?*t_vector))*tstep;
    w_vector=[w_vector w];
    Fourier_f2convf1=[Fourier_f2convf1 Fourier_f2convf1_at_w];
end
figure
subplot(2,1,1)
plot(w_vector, abs(Fourier_f2convf1))% f1(t)*f2(t)�� ���� ����Ʈ��
subplot(2,1,2)
plot(w_vector, angle(?)) % f1(t)*f2(t)�� ���� ����Ʈ��
