clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
t_step=0.001;
t=-5:t_step:5;
tmp=(0<t) & (t<0.05);
figure(1)
plot(t,tmp); title('tmp');axis([-5 5 -2 2]);
tone=sin(2*pi*50*t);
psint=tone.*tmp;
figure(2)
plot(t,psint); title('sine pulse');axis([-5 5 -2 2]);grid on;
pt=sign(psint);
figure(3)
plot(t,pt); title('pt');axis([-5 5 -2 2]);grid on;
randn(1,225); %XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.

td=2+2*rand;  %td는 2~4 범위의 실수가 랜덤으로 생성됨.
delayed_pt = circshift( pt', round(td/t_step) )' ; %td/t_step을 반올림한 수만큼  pt의 요소를 순환적으로 이동 
                                                   %따라서, p(t-td)
nt=randn(1,length(delayed_pt)); % "1 x p(t-td)길이" 의 크기를 갖는 행렬을 n(t)로 반환
bt= delayed_pt+nt; % b(t)= p(t-td) + n(t)
figure(4)
plot(t, bt);axis([-5 5 -5 5]);  %x축을 t로, t에 대한 함수 bt를 x축과 y축 범위를 (-5,5)로 해서 그래프 그리도록

save mydelay.mat td %내용과 상관없는 부분, 그러나 꼭 추가 할 것.
clear td delayed_pt %코드와 상관없는 부분, 그러나 꼭 추가 할 것.


