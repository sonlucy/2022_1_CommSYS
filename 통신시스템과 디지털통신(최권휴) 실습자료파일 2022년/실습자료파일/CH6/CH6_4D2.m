randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
B=500; % BPF를 만들기 위한 LPF의 대역폭
td=0.02; 
t_step=1/8192;
t=0:t_step:0.04;
ht_BPF=2*B*sinc(2*B*(t-td)).*cos(2*pi*3300*t); % BPF의 임펄스 응답 h(t)의 샘플 벡터
yt = conv(xt,ht_BPF);
