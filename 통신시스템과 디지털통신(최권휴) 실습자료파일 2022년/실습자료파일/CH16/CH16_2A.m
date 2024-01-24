clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
%%%%% PART 1 %%%%%%%%%%%
a1=1;   % =  (식 16.3)에서 a1
a2=-1;  % =  (식 16.3)에서 a2
vn=1.5;  % =  (식 16.3)에서 n0의 분산
n0=randn*sqrt(vn);  % = (식 16.3)에서 n0 

d= (rand > 1/2); % 송신한 이진 데이터 (‘1’ or ‘0’), 즉, 비트

if d==1  z_nonoise= a1;  end  %  z_nonoise는 노이즈가 없는 환경의 z값을 의미한다.
if d==0  z_nonoise= a2 ;  end

z=z_nonoise+n0 % = (식 16.3)에서 z
%%%%%%%%%%%%%%%%%%%%%%

%%%%% PART 2 %%%%%%%%%%%%%
if z > (a1+a2)/2  d_estimate=1; end % (식 16.9)의 ML 검출 규칙에 따른 데이터 판별
if z < (a1+a2)/2  d_estimate=0; end % (식 16.9)의 ML 검출 규칙에 따른 데이터 판별
decision_check=(d_estimate==d) % 판별이 올바른 경우에는 decision_check가 1이 되고, 잘못된 경우에는 decision_check가 0이 됨.
%%%%%%%%%%%%%%%%%%%%%%
