%Save it as tx_sig_QAM.m 
clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
a=1; b=1;
M=16;Ts=1;L=16;
t_step=Ts/L;
%%%%%%%%%<1. Pulse waveform generation > %%%%%%%%%%%%%%%%%%%%%%
pt=rcosine(1,L,'normal',0.75); 

%%%%%%%%%<2. Ns���� M-ary symbol generation >%%%%%%%%%%%%%%%%%
Ns=5000; 
dI=2*ceil(rand(1,Ns).^a*sqrt(M))-(sqrt(M)+1);%Ns�� M-ary ������ �ɹ� ��
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
X=? ; %Set X = �ڽ��� �й� ���ڸ� ��
signal_out = [];
for k=1:(X+10)
signal_out=[signal_out signal_out_nth];
end
soundsc(signal_out' ,8000*(X+10));
%����rate�� 8000*(X+10) Hz, �ɹ� rate�� 8000*(X+1)/L Hz
