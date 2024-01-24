clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
Nerrs=50; %Simulation 종료를 위한 총 에러개수. Nerrs 값이 작을수록 실험을 빠르지만 실험오차는 커짐.
EbN0dB_vector=[0 1 3 5 7];
Eb=16;t_step=1/256;
for n=1:length(EbN0dB_vector)
    EbN0dB=EbN0dB_vector(n);
    EbN0=10^(EbN0dB/10);   % dB 값을 linear 값으로(문제 4.A 답 참고)
    N0=Eb/EbN0;
    v_n=N0/(2*t_step);     % variance 설정(문제 4.A 답 참고)
    sim('QPSK_BER')  % 설계한 QPSK_BER.mdl/slx 파일을 실행
    BER_vector(n)=BER(1)
    %workspace로 출력되는 변수 ‘BER’은 (계산된 BER,에러비트수,총비트수)%의 벡터형태로 출력되므로 첫 번째 원소를 취함.
    BER_theory(n)=0.5*erfc(sqrt(EbN0));
end
figure
semilogy(EbN0dB_vector, BER_vector ) %Eb/N0[dB]에 대한 BER 값 그리기
hold on;
semilogy(EbN0dB_vector, BER_theory,'r')
xlabel('Eb/N0 [dB]');ylabel('BER');legend('Simulated','Theory');grid on; hold off


