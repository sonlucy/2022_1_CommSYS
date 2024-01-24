clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
a1=1;
a2=-a1;
vn=1.5;

%%%%%%%%%% �̹����� ��Ʈ���� ����� ����: �ǽ��� ������� �κ� %%%%%%%%%%%%%%%%%%%%%
A=imread('myphoto','jpg');B = rgb2gray(A);C=dec2bin(B,8);[T1 T2]=size(B);Nbits=prod(size(C));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


errcnt=0;
bitcnt=0;
for  bitcnt=1:Nbits   %Nbits=�̹����� ��ü ��Ʈ �� 
                     
    d=bin2dec(C(bitcnt)); % ������Ʈ(d= (rand > 1/2)) ��� �̹��� ��Ʈ�� C�� 'bitcnt'��° ��Ʈ���� ������ ��ȣ d�� �����ϴ� ���� ;   
    
    if d==1 z_nonoise=a1;  end
    if d==0 z_nonoise=a2;  end
    
    n0=randn*sqrt(vn);
    
    z=z_nonoise+n0;
    
    if z > 0  d_estimate=1; end
    if z < 0  d_estimate=0; end
    
    if d_estimate~=d
        errcnt=errcnt+1;
    end
    
    %%%%%�ǽ��� ������� �κ� %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    r_bits(bitcnt)=(d_estimate>0); 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end


BER=errcnt/bitcnt;

%%%%%%%%%% ���� ��Ʈ�� �̹����� ����� �׸��� ����: �ǽ��� ������� �κ� %%%%%%%%%%%%%%%%%%%%%
T=dec2bin(r_bits);L=T1*T2;
for tt=1:8;    sel=(tt-1)*L+(1:L);    Chat(:,tt)=T(sel);end
BB=bin2dec(Chat);
for t2=1:T2;  Bhat(:,t2)=BB(T1*(t2-1)+(1:T1));end
Bhat=uint8(Bhat);
figure(22);imshow(Bhat)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%