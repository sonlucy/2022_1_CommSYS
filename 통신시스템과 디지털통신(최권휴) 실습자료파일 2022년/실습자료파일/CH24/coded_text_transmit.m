clear;clc; rand(1,XX);  %XX = 자신의 학번 뒷 두자리 
load data_bits.mat; global E D;E=-1;D=-1; 

EncodedBits=DataBits;

r=ReceivedAfterAWGNchannel(EncodedBits);clear EncodedBits; % r= 컨벌루션 부호화된 비트열의 원소들을 1과 -1로 바꾼후(BPSK변조) 노이즈를 더한 값. 즉, 수신신호.
z=(r>0);   % z= r의 각 원소들의 부호를 바탕으로 0 과 1로 판별(BPSK복조)한 값.

DecodedBits=z;   

%수신 메시지 출력 라인 
showMessage





