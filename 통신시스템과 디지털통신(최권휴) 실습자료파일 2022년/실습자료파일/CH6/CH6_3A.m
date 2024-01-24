clear
randn(1,225); % XXX=학번 끝 세자리,225
B=2000; %대역폭, 현재 2 kHz 설정
td=0.02; % 지연시간

t_step=1/8192;
t=0:t_step:0.04;
ht=2*B*sinc(2*B*(t-td)); % ht는 LPF 의 임펄스 응답 h(t)의 샘플 벡터

load handel
xt=y'; 
%xt는 LPF입력신호 x(t)의 샘플 벡터, handel의 데이터벡터 y는 열벡터이므로 ' 하여 행으로 바꿈. 

yt=conv(ht,xt); % 입출력과 임펄스 응답과의 관계식 이용
