clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
EsN0= ; %Es/N0, 원하는 값으로 설정
s1= ; % 변조방식에 따라 임의의 심벌 랜덤하게 발생

Es=2*abs(s1)^2;
%신호 s는 2차 벡터공간(복소평면)의 좌표로 원점에서 거리제곱을 에너지로 세팅함.
N0=Es/EsN0;
hA=sqrt(1/2)*(randn+j*randn);
hB=sqrt(1/2)*(randn+j*randn);
n1=sqrt(N0/2)*(randn+j*randn); %T1 구간에서 노이즈 샘플
n2=sqrt(N0/2)*(randn+j*randn); %T2 구간에서 노이즈 샘플
r1=hA*s1+n1; %T1구간에서 수신신호
r2=hB*s1+n2; % T2 구간에서 수신신호
z=conj(?)*r1+conj(?)*r2; %MRC 된 판별변수, z 값으로 심벌 판단.
