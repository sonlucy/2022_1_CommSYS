clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
vn=1.5;
%%%%%%%%%% 이미지를 비트열로 만드는 과정: 실습과 상관없는 부분 %%%%%%%%%%%%%%%%%%%%%
A=imread('myphoto','jpg');B = rgb2gray(A);C=dec2bin(B,8);[T1 T2]=size(B);Nbits=prod(size(C));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a1_vector=[0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.5, 3, 3.5];

for n=1:length(a1_vector)
    
    a1=a1_vector(n);
    a2=-a1;
    
    errcnt=0;
    bitcnt=0;
    for  bitcnt=1:Nbits   %Nbits=이미지의 전체 비트 수
        
        d=bin2dec(C(bitcnt)); % 랜덤비트(d= (rand > 1/2)) 대신 이미지 비트열 C중 'bitcnt'번째 비트값을 보내는 신호 d에 대입하는 과정 ;
        
        if d==1 z_nonoise=a1;  end
        if d==0 z_nonoise=a2;  end
        
        n0=randn*sqrt(vn);
        
        z=z_nonoise+n0;
        
        if z > 0  d_estimate=1; end
        if z < 0  d_estimate=0; end
        
        if d_estimate~=d
            errcnt=errcnt+1;
        end
        
  
        %%%%%실습과 상관없는 부분 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
        r_bits(bitcnt)=(d_estimate>0);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
    
    BER(n)=errcnt/bitcnt
    
    %%%%%%%%%% 수신 비트들 이미지로 만들어 그리는 과정: 실습과 상관없는 부분 %%%%%%%%%%%%%%%%%%%%%
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
