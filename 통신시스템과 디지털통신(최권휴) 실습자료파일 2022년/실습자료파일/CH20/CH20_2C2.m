%tx_sig_gen_Nid.m�� ���� ������ �߰�
figure(200)
for k=2:floor(Ns/3)    % k�� �� ��° ���������� ��Ÿ���� �ε���.
    
    tmp=tx_signal(  ((k-1)*3*L+1)  :  (k*3*L)  ); % k��° 3�ɹ� ����. ���� 2.C1 �� ����. 
    plot(t_step*(0:(3*L-1)), tmp);
    
    axis([0  3 min(tx_signal) max(tx_signal)]);
    grid on; hold on
    %pause
end
hold off


