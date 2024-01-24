% ���� ���� dec.m�� �Ͽ� ����
function result = dec(z)
d1=0; d2=0; d3=0; d4=0; % 4 state (00, 10, 01, 11)�� Accumulated metric ���� �ʱ�ȭ
output1= []; output2=[]; output3=[]; output4=[];
% Trellis ��� decoding�� �����ϰ� �Ǹ�, �� time instance(t1,t2,t3,...)���� 4���� state�� 
% ���� �� ������ survivor path�� ���õǴµ� ��Step 5������ ���������� � ���� ���õ� �� �𸣹Ƿ�, 
% ���ڵ� �߿��� �� state������ survivor path�� �ش��ϴ� encoder �Է��� ����ϰ� �־����. 
% ���� ���, �Ʒ� �������� output1�� ���� time instance�� state 1������ survivor path��
% �ش��ϴ� encoder �Է�, ��, ���� time instance�� state 1���� "�Ķ������� ǥ�õ� path�� �̷�� 
% branch ���� encoder �Է��� ������ ��"�� ����Ѵ�.

for k=1:1:(length(z)/2)
    temp = [z(2*k-1) z(2*k)];
    
    dis00=sum(xor([0 0],temp));dis10=sum(xor([1 0],temp));
    dis01=sum(xor([0 1],temp));dis11=sum(xor([1 1],temp));
    % temp�� �� �� ���ϻ����� �Ÿ�. ���� ���Ǵ� ����̹Ƿ� ������ ������
    
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
