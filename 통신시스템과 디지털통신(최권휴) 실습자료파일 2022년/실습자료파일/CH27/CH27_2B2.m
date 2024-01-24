clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
L=5; max_delay=1.25e-5; decay_base=1;
Nc=16; T=8*max_delay;
t_step=(T/Nc)/16;
f_delta=1/T;
t_vector=0:t_step:(T-t_step); %=t_step*(0:Nc-1)
Ns=length(t_vector); %Cyclic Prefix를 삽입하기 전의 OFDM 심벌(T초)당 샘플 수
GI=1/4;
Ns_in_GI=ceil(Ns*GI);
Ns_total=Ns+Ns_in_GI;
for k=0:(Nc-1)
    subcarrier=1/sqrt(T)*exp(j*2*pi*k*f_delta*t_vector);
    subcarrier_matrix(k+1,:)=subcarrier;
end

pilot_sk=ones(1,Nc);
xt=zeros(1,Ns);
for k=0:(Nc-1)
    s_k=pilot_sk(k+1);
    xt=xt+s_k*subcarrier_matrix(k+1,:);
end
xt_tail=xt((Ns-Ns_in_GI+1):Ns);
pilot_OFDMsymbol=[xt_tail  xt];

ht=ht_mp_ch(max_delay,L,decay_base,t_step);

rt_pilot=conv(pilot_OFDMsymbol,ht);
for k=0:(Nc-1)
    D=t_step*sum(rt_pilot(Ns_in_GI+(1:Ns)).*conj(subcarrier_matrix(k+1,:)));
    F(k+1)=D/pilot_sk(k+1);
end
stem(abs(F));grid on
