clear
randn(1,225); % XXX= 자신의 학번뒤 3자리수 수, 0 으로 시작하여도 상관없음. 학번에 따라 일부 실험 결과가 다르게 나오게 함이니 반드시 추가할것.
T=1; %M(4)-ary signal duration
L=32; % Number of samples per 4-ary symbol ( length of the sampled versions of 4-ary symbols below) 
tstep=T/L; 
tvector=tstep:tstep:T;

%%%%%%%%%%%%%%% 4-ary symbol set generation%%%%%%%%%%%%%%%%%%%%%%%%%
p1t=sqrt(2)*cos(3*pi*tvector);  % z-axis orthonormal basis for 2-D vector space
p2t=sqrt(2)*sin(3*pi*tvector);  % y-axis orthonormal basis

a= 3; b= 2; c= 2; d= -2; e= -1; f= -2; g= -3; h= 1 ; 

s1t=a*p1t +  b*p2t;
s2t=c*p1t +  d*p2t;
s3t=e*p1t +  f*p2t;
s4t=g*p1t +  h*p2t;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% 이미지를 비트열로 만드는 과정: 실습과 상관없는 부분 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sp=2; %3
A=imread('painting','jpg');A=64*(A(1:sp:end,1:sp:end,:)/64);C=dec2bin(A);D=C(:,1:2);[h w dd]=size(A);Nbits=prod(size(D));
data_bits=bin2dec(D(1:end)')';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Nb=length(data_bits); %Number of bits in the image file
Ns=Nb/2; 


%%%%%%%%%%%%% Transmitter signal x(t) generation %%%%%%%%%%%%%%%%%%%%%%
xt=[]  %Initialize the transmit signal vector 
for k=1:Ns  
    %%% 2 bits => 4-ary symbol Mapping%%%%%%%%%%%%%%%%%
    if data_bits([2*k-1, 2*k]) == [0 0]
        st=s1t;
    elseif data_bits([2*k-1, 2*k]) == [0 1]
        st=s2t;
    elseif data_bits([2*k-1, 2*k]) == [1 0]
        st=s3t;
    else
        st=s4t;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    xt=[xt st];  %Concatenate ‘st' to xt’.    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xt_len=length(xt)   %vector length of 'xt'

%%%%%%%%%Received signal after AWGN channel%%%%%%%%%%%%%%%%%%%%%%%%%
noise_sample=3*randn(1,xt_len);   %AWGN 
rt=xt+noise_sample;   %noise addition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

save st_and_rt.mat Ns L tstep tvector p1t p2t s1t s2t s3t s4t rt
