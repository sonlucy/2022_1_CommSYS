%Save it as tx_sig_QAM.m 
clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
a=1; b=1;
M=16;Ts=1;L=16;
t_step=Ts/L;
%%%%%%%%%<1. Pulse waveform generation > %%%%%%%%%%%%%%%%%%%%%%
pt=rcosine(1,L,'normal',0.75); 

%%%%%%%%%<2. Ns개의 M-ary symbol generation >%%%%%%%%%%%%%%%%%
Ns=5000; 
dI=2*ceil(rand(1,Ns).^a*sqrt(M))-(sqrt(M)+1);%Ns는 M-ary 데이터 심벌 수
dQ=2*ceil(rand(1,Ns).^b*sqrt(M))-(sqrt(M)+1);
%%%%%%%%<3. Impulse modulation >%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
impulse_modulated_I=[ ];
impulse_modulated_Q=[ ];
for n=1:Ns
    impulse_signal_I= [dI(n)  zeros(1, L-1)];   
    impulse_modulated_I=[impulse_modulated_I  impulse_signal_I];
    impulse_signal_Q= [dQ(n)  zeros(1, L-1)];   
    impulse_modulated_Q=[impulse_modulated_Q  impulse_signal_Q];
end
%%%%%%%%<4.Pulse shaping (Transmitter filtering)>%%%%%%%%%%
tx_signal_I=conv(impulse_modulated_I, pt);
tx_signal_Q=conv(impulse_modulated_Q, pt);
signal_out_nth=[tx_signal_I' tx_signal_Q']';
X=? ; %Set X = 자신의 학번 끝자리 수
signal_out = [];
for k=1:(X+10)
signal_out=[signal_out signal_out_nth];
end
soundsc(signal_out' ,8000*(X+10));
%샘플rate은 8000*(X+10) Hz, 심벌 rate은 8000*(X+1)/L Hz
