figure
pwelch(x_t,[],[],[],11025);hold on;
[x y]=pwelch(y_t,[],[],[],11025);
plot(y/1000,10*log10(x),'r'); axis([0 1 -100 -20]); 
%legend('���� ���� ����Ʈ��', '�ݻ��Ķ� ������ ���� ����Ʈ��');
hold off;
