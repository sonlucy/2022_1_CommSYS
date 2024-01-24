clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
EsN0=  ;  %Es/N0, 원하는 값으로 설정
s1=  ;    % 변조방식에 따라 임의의 심벌 랜덤하게 발생

Es=2*abs(s1)^2;

hA=sqrt(1/2)*(randn+j*randn);
hB=sqrt(1/2)*(randn+j*randn);
n=sqrt(N0/2)*(randn+j*randn);
sA=s1; % 안테나 A의 송신 신호
sB=s1; % 안테나 B의 송신 신호
r=hA*sA+hB*sB+n;

