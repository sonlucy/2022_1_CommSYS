
S_ID=rand(1,225); % XXX= 자신의 학번뒤 3자리수 수, 0 으로 시작하여도 상관없음. 학번에 따라 일부 실험 결과가 다르게 나오게 함이니 반드시 추가할것.
load st_and_rt.mat %송/수신신호 데이터값을 로드한다.

a11=sum(s1t.*p1t)*tstep;%식(18.3)을 수치적분으로 구현
a12=sum(s1t.*p2t)*tstep;%식(18.3)을 수치적분으로 구현
s1=[a11,a12] %신호 s1t의 좌표(2차원 벡터공간에서 x축 a11, y축 a12)를 저장.

% 위와 동일한 방식 %
a21=sum(s2t.*p1t)*tstep;
a22=sum(s2t.*p2t)*tstep;
s2=[a21,a22]
a31=sum(s3t.*p1t)*tstep;
a32=sum(s3t.*p2t)*tstep;
s3=[a31,a32]
a41=sum(s4t.*p1t)*tstep;
a42=sum(s4t.*p2t)*tstep;
s4=[a41,a42]

data_bits_hat=[];    % 복조된 비트를 저장하기 위한 벡터 초기화
for n=1:Ns % n=1부터 시작해서 Ns까지. rt의 4-ary 신호의 순차적인 인덱스로 사용.
    rt_nth= rt( ((n-1)*L+1) :  n*L  );   % n번째 전송된 4-ary 신호에 대한 수신 신호 샘플벡터
    z1= sum(rt_nth.*p1t)*tstep; z2= sum(rt_nth.*p2t)*tstep; % 수신 신호의 벡터 좌표 z1,z2
    z=[z1,z2];                           % 위에서 구한 수신신호의 벡터 좌표를 저장
    ED_z_s1=sum(abs(z-s1).^2);           % z와 s1 유클리드 거리의 제곱
    ED_z_s2=sum(abs(z-s2).^2);           % z와 s2 유클리드 거리의 제곱
    ED_z_s3=sum(abs(z-s3).^2);           % z와 s3 유클리드 거리의 제곱
    ED_z_s4=sum(abs(z-s4).^2);           % z와 s4 유클리드 거리의 제곱
    
    [T1 T2]=min([ED_z_s1, ED_z_s2, ED_z_s3,ED_z_s4]); % z와 가장 가까운 좌표 검출 (ML검출) 
    if T2==1 %z와 가장 가까운 좌표를 가진 신호가 s1일 경우
        twobits_hat= [0 0] ; % Step 5, <표 18.1>에 따라 검출된 두 비트를 twobits_hat에 대입
    elseif T2==2 %z와 가장 가까운 좌표를 가진 신호가 s2일 경우
        twobits_hat= [0 1] ;
    elseif T2==3 %z와 가장 가까운 좌표를 가진 신호가 s3일 경우
        twobits_hat= [1 0] ;
    else %z와 가장 가까운 좌표를 가진 신호가 s4일 경우
        twobits_hat= [1 1] ;
    end
    
    data_bits_hat=[data_bits_hat  twobits_hat];% 검출된 비트를 비트열로 연결. for문을 돌면서 계속해서 비트를 이어감.
end
