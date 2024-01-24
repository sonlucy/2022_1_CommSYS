
S_ID=rand(1,225); % XXX= 자신의 학번뒤 3자리수 수, 0 으로 시작하여도 상관없음. 학번에 따라 일부 실험 결과가 다르게 나오게 함이니 반드시 추가할것.
load st_and_rt.mat

data_bits_hat=[];    %복조된 비트를 저장하기 위한 벡터 초기화
for n=1:Ns
    rt_nth= rt( ((n-1)*L+1) :  n*L  ); %n 번째 M-ary 수신신호 샘플
    
    C_rt_nth_s1t=sum(rt_nth.*s1t)*tstep; %수신신호와 s1t의 상관값을 수치적분으로 계산
    C_rt_nth_s2t=sum(rt_nth.*s2t)*tstep;
    C_rt_nth_s3t=sum(rt_nth.*s3t)*tstep;
    C_rt_nth_s4t=sum(rt_nth.*s4t)*tstep;
    
    [T1 T2]=max([C_rt_nth_s1t,C_rt_nth_s2t,C_rt_nth_s3t,C_rt_nth_s4t ]); % M-ary 신호 중 수신신호와 상관값이 가장 높은 신호를 찾음
    
    if T2==1
        twobits_hat= [0 0]  % <표 18.1>을 참고하여 복조한 M-ary 신호에 따라 데이터를 매핑
    elseif T2==2
        twobits_hat= [0 1] 
    elseif T2==3
        twobits_hat= [1 0] 
    else
        twobits_hat= [1 1] 
    end
    
    data_bits_hat=[data_bits_hat  twobits_hat]; % 검출된 비트를 비트열로 연결
end
