clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
Nr=2;
Ha=[2, 1;1, 2];
Hb=[1, 1;1, -1];

EsN0dB=3;
EsN0=10^(EsN0dB/10);
Es=Nr*1;
%본 m-file에서는 1 또는 -1을 갖는 BPSK 심벌을 생성함(아래 s생성 문장 참조)
N0=Es/EsN0;
ErrCntZF=0; ErrCntML=0;SymCnt=0;
while ErrCntML<500 %PC 속도가 느리면 500을 줄일 것. 대신 실험오차는 증가함.
    s=sign(rand(2,1)-0.5);
    H=Ha; % Hb 채널을 실험할 경우 H=Hb로 변경
    n=sqrt(N0/2)*(randn(2,1)+j*randn(2,1));
    r=H*s+n;
    
    s_hat_zf=zf_bpsk(r,H); % 동일한 폴더에 zf_bpsk()이 있어야 함.
    ErrCntZF=ErrCntZF+sum(s~=s_hat_zf);
    
    s_hat_ml=ml_Nt2_bpsk(r,H); % 동일한 폴더에 ml_2x2_bpsk()이 있어야 함.
    ErrCntML=ErrCntML+sum(s~=s_hat_ml);
    
    SymCnt=SymCnt+2;
end
ber_zf=ErrCntZF/SymCnt
ber_ml=ErrCntML/SymCnt
