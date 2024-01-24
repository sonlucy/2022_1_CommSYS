clear
randn(1,XXX); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
Nr=2;
Ha=[2, 1;1, 2];
Hb=[1, 1;1, -1];

EsN0dB=3;
EsN0=10^(EsN0dB/10);
Es=Nr*1;
%�� m-file������ 1 �Ǵ� -1�� ���� BPSK �ɹ��� ������(�Ʒ� s���� ���� ����)
N0=Es/EsN0;
ErrCntZF=0; ErrCntML=0;SymCnt=0;
while ErrCntML<500 %PC �ӵ��� ������ 500�� ���� ��. ��� ��������� ������.
    s=sign(rand(2,1)-0.5);
    H=Ha; % Hb ä���� ������ ��� H=Hb�� ����
    n=sqrt(N0/2)*(randn(2,1)+j*randn(2,1));
    r=H*s+n;
    
    s_hat_zf=zf_bpsk(r,H); % ������ ������ zf_bpsk()�� �־�� ��.
    ErrCntZF=ErrCntZF+sum(s~=s_hat_zf);
    
    s_hat_ml=ml_Nt2_bpsk(r,H); % ������ ������ ml_2x2_bpsk()�� �־�� ��.
    ErrCntML=ErrCntML+sum(s~=s_hat_ml);
    
    SymCnt=SymCnt+2;
end
ber_zf=ErrCntZF/SymCnt
ber_ml=ErrCntML/SymCnt
