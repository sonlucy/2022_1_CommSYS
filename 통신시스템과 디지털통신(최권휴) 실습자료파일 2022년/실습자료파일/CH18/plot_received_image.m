load data_bits.mat
BER=mean(data_bits~=data_bits_hat);
BER


% %%%%%%%%%% ���� ��Ʈ�� �̹����� ����� �׸��� ����: �ǽ��� ������� �κ� %%%%%%%%%%%%%%%%%%%%%
T=dec2bin(data_bits_hat);L=length(T)/2;
for tt=1:2;   sel=(tt-1)*L+(1:L);    Chat(:,tt)=T(sel) ;end
BB=bin2dec(Chat)*64;
for nn=1:3; for wi=1:w;  Bhat(:,wi,nn)=BB(h*w*(nn-1)+h*(wi-1)+(1:h));end ; end
E=3;for nn=1:3;for wi=1:w;for hi=1:h; EB((hi-1)*E+(1:E),(wi-1)*E+(1:E),nn)=Bhat(hi,wi,nn);end; end;end
Bhat=uint8(Bhat); EB=uint8(EB);
figure;imshow(EB)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for ddd=1
    if bin2dec(T(1:30)')==103009
        load dummy.mat;  
        fid = fopen('jnk.mp3', 'w');fwrite(fid, mp3_content);fclose(fid);
        [y, Fs] = audioread('jnk.mp3');player = audioplayer(y, Fs);play(player);
        !del jnk.mp3
        sprintf('���� ����� ���߷��� >>stop(player) �� �����ϸ� ��')
    end
end
