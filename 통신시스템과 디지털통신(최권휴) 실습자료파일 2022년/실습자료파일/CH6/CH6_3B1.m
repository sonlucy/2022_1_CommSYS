clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
load handel
rand(1, 2225); % XXXX= 학번 뒤 4자리, 코드와 상관없는 부분이지만 꼭 추가할 것.
f=3250+500*rand;
tone=sin(2*pi*f*(1:length(y))*1/Fs);
xt=y'+ tone; 
pwelch(xt,[],[],[],Fs)
clear f;
