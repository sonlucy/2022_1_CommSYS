clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
EsN0= ; %Es/N0, 원하는 값으로 설정
s= ;
%심벌 값, 변조방식에 맞춰 복소평면에서 생성, 예를 들어
%QPSK인 경우, s=sign(rand-0.5)+j*sign(rand-0.5), BPSK 인 경우 s=sign(rand-0.5);

Es=abs(s)^2;
%신호 s는 2차 벡터공간(복소평면)의 좌표로 원점에서 거리제곱을 에너지로 세팅함.
N0=Es/EsN0;
h=sqrt(1/2)*(randn+j*randn);
n=sqrt(N0/2)*(randn+j*randn);
r=h*s+n;