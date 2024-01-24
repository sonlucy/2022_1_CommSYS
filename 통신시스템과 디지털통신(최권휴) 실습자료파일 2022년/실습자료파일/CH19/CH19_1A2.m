clear
S_ID=rand(1,XXX); % XXX= 자신의 학번뒤 3자리수 수, 0 으로 시작하여도 상관없음. 학번에 따라 일부 실험 결과가 다르게 나오게 함이니 반드시 추가할것.
load st_and_rt.mat

noise_sample= 2*randn(1,L*100000);   %AWGN
rt=noise_sample;   % 오직 노이즈 뿐 인 수신 신호

z1s=[]; z2s=[]; z2when_z1inR1=[]; z2when_z1inR2=[];
for n=1:70000
    
    rt_nth= rt( ((n-1)*L+1): n*L ); %n번째 M-ary 심벌기간의 수신신호 샘플
    
    z1=sum(rt_nth.*?)*tstep; % (식 18.3)에 따라 수신신호를 벡터공간상의 한 점으로 변환
    z2=sum(rt_nth.*?)*tstep; % (식 18.3)에 따라 수신신호를 벡터공간상의 한 점으로 변환
    
    if 0<=z1 && z1<=0.1
        z2when_z1inR1=[z2when_z1inR1 z2]; % z1이 R1 영역에 포함될 때, z2를 수집
    end
    
    if 0.2<=z1 && z1<=0.3
        z2when_z1inR2=[z2when_z1inR2 z2]; % z1이 R2 영역에 포함될 때, z2를 수집
    end
    
    z1s=[z1s z1]; z2s=[z2s z2];
end
