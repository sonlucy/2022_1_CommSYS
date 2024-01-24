clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
syms c EbN0 
instantBER=0.5*(1-erf(sqrt(c*EbN0)));
BER_fading=int(instantBER*exp(-c),c,0,inf);
pretty((BER_fading))
