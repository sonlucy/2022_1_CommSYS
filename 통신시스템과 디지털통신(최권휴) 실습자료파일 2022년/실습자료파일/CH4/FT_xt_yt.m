figure
pwelch(x_t,[],[],[],11025);hold on;
[x y]=pwelch(y_t,[],[],[],11025);
plot(y/1000,10*log10(x),'r'); axis([0 1 -100 -20]); 
%legend('원래 음원 스펙트럼', '반사파랑 더해진 음원 스펙트럼');
hold off;
