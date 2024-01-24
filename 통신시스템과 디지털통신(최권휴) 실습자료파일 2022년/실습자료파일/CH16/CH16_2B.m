clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
vn=1.5;
%%%%%%%%%% �̹����� ��Ʈ���� ����� ����: �ǽ��� ������� �κ� %%%%%%%%%%%%%%%%%%%%%
A=imread('myphoto','jpg');B = rgb2gray(A);C=dec2bin(B,8);[T1 T2]=size(B);Nbits=prod(size(C));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a1_vector=[0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.5, 3, 3.5];

for n=1:length(a1_vector)
    
    a1=a1_vector(n);
    a2=-a1;
    
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
    
    BER(n)=errcnt/bitcnt
    
    %%%%%%%%%% ���� ��Ʈ�� �̹����� ����� �׸��� ����: �ǽ��� ������� �κ� %%%%%%%%%%%%%%%%%%%%%
    T=dec2bin(r_bits);L=T1*T2;
    for tt=1:8;    sel=(tt-1)*L+(1:L);    Chat(:,tt)=T(sel);end
    BB=bin2dec(Chat);
    for t2=1:T2;  Bhat0(:,t2)=BB(T1*(t2-1)+(1:T1));end
    Bhat(:,:,n)=uint8(Bhat0);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
end
figure
semilogy(a1_vector,BER)
xlabel('a_1'); ylabel('BER');
grid on

%a2_vector= -a1_vector;
%BER_exact=0.5*erfc(((a1_vector-(a2_vector))./(2*sqrt(vn)))/sqrt(2));
%hold on
%semilogy(a1_vector, BER_exact, 'r');
