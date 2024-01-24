%tx_sig_gen_Nid.m에 다음 내용을 추가
figure(200)
for k=2:floor(Ns/3)    % k는 몇 번째 조각인지를 나타내는 인덱스.
    
    tmp=tx_signal(  ((k-1)*3*L+1)  :  (k*3*L)  ); % k번째 3심벌 구간. 문제 2.C1 답 참조. 
    plot(t_step*(0:(3*L-1)), tmp);
    
    axis([0  3 min(tx_signal) max(tx_signal)]);
    grid on; hold on
    %pause
end
hold off


