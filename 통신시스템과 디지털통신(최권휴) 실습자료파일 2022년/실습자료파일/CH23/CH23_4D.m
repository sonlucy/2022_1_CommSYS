%Save this file as QAM_BER_sim.m
clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
EbN0dB_vector=2:2:12;   
Eb=2.5; %문제 1.B5 의 답
t_step=1/100; % ‘16QAM_AWGN’ 블록의 ‘out1’ 출력의 샘플 간격 (노이즈 샘플 간격과 동일)
for n=1:length(EbN0dB_vector)
    EbN0dB=EbN0dB_vector(n);
    EbN0=  ?;   % dB 값을 linear 값으로(21장 1.A 과정 참고)
    N0=Eb/EbN0;  % N0값 계산
    v_n= ?;      % variance 설정(식 23.2 참고)
    sim('QAM_BER')  % 설계한 QAM_BER.mdl/slx 파일을 실행
    BER_vector(n)=ErrorVec(1) % workspace의 BER은 벡터로 저장됨.
end
figure
semilogy(EbN0dB_vector, BER_vector ) % Eb/N0[dB]에 대한 BER 값 그리기
hold on;
BER_theory=berawgn(EbN0dB_vector,'qam',16,'gray'); 
semilogy(EbN0dB_vector, BER_theory,'r')
xlabel('Eb/N0 [dB]');ylabel('BER');legend('Simulated','Theory');grid on; hold off