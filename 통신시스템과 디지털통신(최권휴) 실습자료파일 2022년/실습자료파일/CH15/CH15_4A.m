clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
figure 
ID=[2,2,0,1,2,2,2,5];% 자신의 학번 각 자리수로 대체할 것.
for trial=1:100
xt=conv(randn(1,100),ID)+4.35; % xt생성. 생성원리(우변)는 몰라도 무방.
  plot(xt)
  xlabel('t [sec]')
  pause
end
