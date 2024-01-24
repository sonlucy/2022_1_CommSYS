clear
S_ID=rand(1,225); % XXX= 자신의 학번뒤 3자리수 수, 0 으로 시작하여도 상관없음. 학번에 따라 일부 실험 결과가 다르게 나오게 함이니 반드시 추가할것.
load st_and_rt.mat
data_bits_hat=[]; %복조된 비트를 저장하기 위한 벡터 초기화
for n=1:Ns
    rt_nth= rt( ((n-1)*L+1) : n*L ); %n 번째 M-ary 수신신호 샘플
    
    E_rt_s1t=sum(abs(rt_nth-s1t).^2)*tstep; % rt_nth와 s1t의 차에너지 수치적분
    E_rt_s2t=sum(abs(rt_nth-s2t).^2)*tstep;
    E_rt_s3t=sum(abs(rt_nth-s3t).^2)*tstep;
    E_rt_s4t=sum(abs(rt_nth-s4t).^2)*tstep;
 
    
    
    [T1 T2]=min([E_rt_s1t,E_rt_s2t,E_rt_s3t,E_rt_s4t]);
    
    if T2==1
        twobits_hat= [0 0] ;
    elseif T2==2
        twobits_hat= [0 1];
    elseif T2==3
        twobits_hat= [1 0];
    else
        twobits_hat= [1 1];
    end
    
    data_bits_hat=[data_bits_hat  twobits_hat]; % 검출된 비트를 비트열로 연결
end
