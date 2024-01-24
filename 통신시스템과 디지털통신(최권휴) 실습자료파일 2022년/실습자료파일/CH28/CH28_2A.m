clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
EsN0= ; %Es/N0, 원하는 값으로 설정
s1= ; % 변조방식에 따라 임의의 심벌 랜덤하게 발생
s2= ; % 변조방식에 따라 임의의 심벌 랜덤하게 발생

Es=2*abs(s1)^2;
%신호 s는 2차 벡터공간(복소평면)의 좌표로 원점에서 거리제곱을 에너지로 세팅함.
N0=Es/EsN0;

hA=sqrt(1/2)*(randn+j*randn);
hB=sqrt(1/2)*(randn+j*randn);
n1=sqrt(N0/2)*(randn+j*randn);  %T1구간의 수신 노이즈
n2=sqrt(N0/2)*(randn+j*randn);  %T2구간의 수신 노이즈
r1=hA*s1+hB*s2+n1;
r2= ? ;

