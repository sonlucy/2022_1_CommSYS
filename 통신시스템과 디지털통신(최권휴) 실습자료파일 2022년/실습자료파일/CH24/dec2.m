% ���� ���� dec2.m�� ����
function result = dec2(z)
d1=0; d2=0; d3=0; d4=0;
output1= []; output2=[]; output3=[]; output4=[];

for k=1:1:(length(z)/3)
    temp = [z(3*k-2) z(3*k-1) z(3*k)];
    
    dis000=sum(xor([0 0 0],temp)); dis011=sum(xor([0 1 1],temp));
    dis100=sum(xor([1 0 0],temp)); dis111=sum(xor([1 1 1],temp));
    
    % �׸�24.2�� encoder ������ �����غ��� �׸� 24.1�� encoder ����� �� �ڿ� ���� 0 �Ǵ� 1�� 
    % �߰��Ǿ����� �� �� �ִ�. ���� ��� dec.m���� ����ߴ� dis10�� dec2.m������ dis100���� 
    % ����Ǿ��� ���̹Ƿ� ����� �ʰ� ������ �� �ִ�.
    if k==1
        new_output1 = [output1 0]; new_d1 = d1 + dis000;
        new_output2 = [output2 1]; new_d2 = d2 + dis111;
    elseif k==2
        ?
        ...
        ?
    else
        ?
        ...
        ?
    end
    
    % memory update
    if k==1
        d1=new_d1; d2=new_d2;
        output1=new_output1;     output2=new_output2;
    else
        d1=new_d1; d2=new_d2;  d3=new_d3; d4=new_d4;
        output1=new_output1;  output2=new_output2;
        output3=new_output3; output4=new_output4;
    end
end

output = [output1; output2; output3; output4];
d=[d1 d2 d3 d4];
ML_state_index=find(d==min(d));
result = output(ML_state_index(1),:);

