clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
Nid=1225;  %XXX= 자신의 학번 뒤 3자리. while문 반복 위한 변수
cnt=0; % X값이 조건에 맞을때마다 카운트를 세기위한 변수 
Total_trial=0;  %토탈실행횟수 저장 위한 변수
while cnt < Nid  % X>=1.5인 샘플의 개수가 Nid가 될때까지 반복
  X=sqrt(0.5)*randn + 1;  %평균 1, 분산 0.5 대입
  if X >= 3.5
     cnt=cnt+1;  %X>=1.5인 경우마다 카운트 세기. (카운트 증가)
  end
  Total_trial=Total_trial+1; %토탈실행횟수 저장하기위해
end
P=cnt/Total_trial %X>1.5일때마다 카운트한걸 토탈실행횟수로 나누어 Pr{X>=1.5}구하기
