function result = decSD_K3(z)
global D;D=1;
d1=0; d2=0; d3=0; d4=0; %4 state의 Accumulated metric 변수
output1= []; output2=[]; output3=[]; output4=[];
for k=1:1:(length(z)/2)
    temp = [z(2*k-1) z(2*k)];
    %%%%%%%%%%% Step 1, 2-1, 3-1. %%%%%%%%%%%
    dis00=sum( ([-1 -1]-temp).^2 );
    dis01=sum( ([-1  1]-temp).^2 );
    dis10=sum( ([1 -1]-temp).^2 );
    dis11=sum( ([1  1]-temp).^2 );
    
    %%%%%%%%%%% Step 1. %%%%%%%%%%%
    if k==1
        new_output1 = [output1 0]; new_d1 = d1 + dis00;
        new_output2 = [output2 1]; new_d2 = d2 + dis11;
        %%%%%%%%%%% Step 2. 2-1. %%%%%%%%%%%
    elseif k==2
        new_output1 = [output1 0]; new_d1=d1+dis00;
        new_output2 = [output1 1]; new_d2=d1+dis11;
        new_output3 = [output2 0]; new_d3=d2+dis01;
        new_output4 = [output2 1]; new_d4=d2+dis10;
    else
        %%%%%%%%%%% Step 3~ step4. %%%%%%%%%%%
        if d1+dis00 < d3+dis11; % Step 3-3
            new_output1 = [output1 0]; new_d1=d1+dis00; % Step 3-2
        else
            new_output1 = [output3 0]; new_d1=d3+dis11; % Step 3-2
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if d1+dis11 < d3+dis00; % Step 3-3
            new_output2 = [output1 1]; new_d2=d1+dis11; % Step 3-2
        else
            new_output2 = [output3 1]; new_d2=d3+dis00; % Step 3-2
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if d2+dis01 < d4+dis10 % Step 3-3
            new_output3 = [output2 0]; new_d3=d2+dis01; % Step 3-2
        else
            new_output3 = [output4 0]; new_d3=d4+dis10; % Step 3-2
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if d2+dis10 < d4+dis01 % Step 3-3
            new_output4 = [output2 1]; new_d4=d2+dis10; % Step 3-2
        else
            new_output4 = [output4 1]; new_d4=d4+dis01; % Step 3-2
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
    % metric and path history update
    if k==1 %Step 1.
        d1=new_d1; d2=new_d2;
        output1=new_output1; output2=new_output2;
    else %Step 2-2. Step 3-2. Step 3-3.
        d1=new_d1; d2=new_d2; d3=new_d3; d4=new_d4; %Step 3-3.
        output1=new_output1; output2=new_output2;
        output3=new_output3; output4=new_output4;
    end
end
%%%%%%%%%%% Step 5. %%%%%%%%%%%
output = [output1; output2; output3; output4];
d=[d1 d2 d3 d4];
ML_state_index=find(d==min(d)); %ML로 추정한 최소거리의 index. ML을 이용하여 0이 아니고 가장 짧은 거리를 가진 값을 찾음
result = output(ML_state_index(1),:); %추정된 비트 결과. 가장 짧은 거리로 추정된 비트값을 result에 저장
