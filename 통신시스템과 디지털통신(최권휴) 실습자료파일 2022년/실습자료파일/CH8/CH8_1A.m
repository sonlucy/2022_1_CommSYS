clear
randn(1,225); % 225=학번 끝 세자리. 1X225 크기의 행렬 반환
t_step=0.001;  %변수 t의 간격
t=-5:t_step:5;  %변수 t는 -5에서 t_step간격으로 5까지의 행벡터 생성하여 샘플링 위한 샘플벡터 생성
tmp=(0<t) & (t<0.05);  %변수 tmp는 0<=t<=0.05인 범위에서 1의 값을 가진다.
figure(1)  %새 그림창 만들고 속성을 1로 설정
plot(t,tmp); title('tmp');axis([-5 5 -2 2]); %figure1에 x축t, t에 대한 함수 tmp
                                             %그래프의 타이틀을 tmp로, 
                                             %x축 범위와 y축범위를 각각 -5~5, -2~2로 설정
                                        

tone=sin(2*pi*50*t); %t에 대한 사인함수를 tone변수에 저장 (사인함수는 주파수 50Hz의 사인파형)
psint=tone.*tmp; %tone함수를 위에서 만든 tmp함수와 곱해줌. 
% 따라서 psint변수는 0<=t<=0.05 범위만 가지는 tone함수를 얻게됨.

figure(2) %새 그림창 만들고 속성을 2로 설정
plot(t,psint); title('sine pulse');axis([-5 5 -2 2]);grid on; %figure2에 x축이 t인 이 t에 대한 함수 tmp를 그림.
                                                              %그래프이 타이틀을
                                                              %sine pulse로,
                                                              %x축 범위와 y축범위를 각각 -5~5, -2~2로 설정
                                                              %grid on:그래프에 줄선 추가
                                                              
pt=sign(psint);
figure(3)
plot(t,pt);title('pt');axis([-5 5 -2 2]); grid on;
                                                              
