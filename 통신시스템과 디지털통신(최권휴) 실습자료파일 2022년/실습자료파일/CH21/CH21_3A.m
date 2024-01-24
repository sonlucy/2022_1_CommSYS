clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
%%%Signal pulse design %%%%%%%%%%%%%%%%%%%%%%%%%%%
Ts=1; L=16;
t_step=Ts/L;
pt=rcosine(1,L,'sqrt',0.5); N=length(pt);
% Roll-off factor=0.5인 ‘square root raised cosine’을 펄스를 고려. ‘rcosine()’ 함수 사용법은 20장의 문제 1.D를 참조

%%% Signal(BPSK 인 경우 비트) Energy 계산 %%%%%%%%%%%%%%%%%%%%%%%
Eb=sum(pt.^2)*t_step ;

%%%% 여기서부터 N0 세팅 part %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
EbN0dB=9; % 일단 Eb/N0 = 100dB로 주어졌다 가정.

EbN0=10^(EbN0dB/10); %아래 참고2. dB를 Linear 값으로 환산하는 식. 주어진 EbN0dB가 추후 바뀌면 EbN0 가 따라서 바뀔 수 있도록 EbN0dB가 들어간 함수식으로 완성할 것
N0= Eb/EbN0 ; % Eb와 EbN0를 이용한 계산식. 역시, 위의 EbN0dB 가 추후 바뀌더라도 N0가 따라서 바뀔수 있도록 Eb, EbN0가 들어간 함수식으로 완성할 것

v_n=N0/(2*t_step);  %노이즈샘플의 분산 계산

sum_Ne=0;  % 전체 에러 수 초기화
N_frame=0;  % 실험할 프레임 수

%for  frame_number=1:N_frame
while sum_Ne<25

    %%%%%%%%%<2. 100 bit (binary symbol) generation>%%%%%%%%%%%%%%%%%%%%
    Ns=100;
    data_bit=(rand(1,Ns)>0.5);
    
    %%%%%%%%%<3. Unipolar to Bipolar (amplitude modulation)>%%%%%%%%%%%%%%
    amp_modulated=2*data_bit-1; % 0=> -1,  1=>1
    
    %%%%%%%%%<4. Impulse modulation >%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    impulse_modulated=[];
    for n=1:Ns
        delta_signal= [amp_modulated(n)  zeros(1, L-1)];
        impulse_modulated=[impulse_modulated  delta_signal];
    end
    
    %%%%%%%%<5.Pulse shaping (Transmitter filtering)>%%%%%%%%%%
    tx_signal=conv(impulse_modulated, pt);
    
    %%%%%%<Noise sample 발생 >%%%%%%%%%%%%%%%%%%%%%
    n_samples=sqrt(v_n)*randn(1,length(tx_signal));%Generate n[k]
    
    %%%%%%<수신 신호 샘플 발생>%%%%%%%%%%%%
    r_samples = tx_signal + n_samples;
    
    z_samples=conv(r_samples,pt);  %정합 필터 (matched filtering
       
    
    estimated_data_bit= (z_samples(N+((1:Ns)-1)*L) >0 ); % 문제2.H에서 구현한 데이터비트 추정
    
    %%%%%%%%%< Step 8을 구현하기 위해 새로 추가한 부분 >%%%%%%%%%%%
    Ne=sum(estimated_data_bit~=data_bit);  % 판별된비트와 송신된비트를 비교해서 에러 개수 합산 (한 프레임에 대하여)
    sum_Ne=sum_Ne +Ne;  %각각의 프레임에 대한 에러개수를 for문을 통해 모든 프레임에 대해 합산하여 저장

    N_frame=N_frame+1;
end

% 아래의 식으로 BER 계산, BER=전체 비트 에러 발생 개수/전송된 전체 비트 수
Total_bit=N_frame*Ns;
BER=sum_Ne/Total_bit
