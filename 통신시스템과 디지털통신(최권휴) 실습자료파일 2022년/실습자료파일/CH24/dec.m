% 파일 명은 dec.m로 하여 저장
function result = dec(z)
d1=0; d2=0; d3=0; d4=0; % 4 state (00, 10, 01, 11)의 Accumulated metric 변수 초기화
output1= []; output2=[]; output3=[]; output4=[];
% Trellis 기반 decoding을 수행하게 되면, 매 time instance(t1,t2,t3,...)에서 4개의 state에 
% 각각 한 개씩의 survivor path가 선택되는데 ‘Step 5’에서 최종적으로 어떤 것이 선택될 줄 모르므로, 
% 디코딩 중에는 각 state까지의 survivor path의 해당하는 encoder 입력을 기억하고 있어야함. 
% 예를 들어, 아래 변수에서 output1은 현재 time instance의 state 1까지의 survivor path에
% 해당하는 encoder 입력, 즉, 현재 time instance의 state 1까지 "파란색으로 표시된 path를 이루는 
% branch 들의 encoder 입력을 연결한 것"을 기억한다.

for k=1:1:(length(z)/2)
    temp = [z(2*k-1) z(2*k)];
    
    dis00=sum(xor([0 0],temp));dis10=sum(xor([1 0],temp));
    dis01=sum(xor([0 1],temp));dis11=sum(xor([1 1],temp));
    % temp와 각 네 패턴사이의 거리. 자주 사용되는 계산이므로 변수로 저장함
    
    if k==1
        new_output1 = [output1 0]; new_d1 = d1 + dis00;
        new_output2 = [output2 1]; new_d2 = d2 + dis11;
    elseif k==2
        new_output1 = [output1 0]; new_d1=d1+dis00;
        new_output2 = [output1 1]; new_d2=d1+dis11;
        new_output3 = [output2 0]; new_d3=d2+dis01;
        new_output4 = [output2 1]; new_d4=d2+dis10;
    else
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if d1+dis00 < d3+dis11;
            new_output1 = [output1 0];  new_d1=d1+dis00;
        else
            new_output1 = [output3 0]; new_d1=d3+dis11;
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if d1+dis11 < d3+dis00;
            new_output2 = [output1 1]; new_d2=d1+dis11;
        else
            new_output2 = [output3 1]; new_d2=d3+dis00;
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if d2+dis01 < d4+dis10
            ???
        else
            ???
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if ??? < ???
            ???
        else
            ???
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
    
    % variables update
    if k==1
        d1=new_d1; d2=new_d2;
        output1=new_output1; output2=new_output2;
    else
        d1=new_d1; d2=new_d2; d3=new_d3; d4=new_d4;
        output1=new_output1; output2=new_output2;
        output3=new_output3; output4=new_output4;
    end
end

output = [output1; output2; output3; output4];
d=[d1 d2 d3 d4];
ML_state_index=find(d==min(d));
result = output(ML_state_index(1),:);
