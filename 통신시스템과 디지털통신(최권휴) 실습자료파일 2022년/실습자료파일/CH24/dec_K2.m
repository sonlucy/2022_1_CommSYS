function result = dec_K2(z)
global D;D=0;
d1=0; d2=0; 
output1= []; output2=[];
for k=1:1:(length(z)/2)
    temp = [z(2*k-1) z(2*k)];
    dis00=sum(xor([0 0],temp)); dis01=sum(xor([0 1],temp));
    dis10=sum(xor([1 0],temp)); dis11=sum(xor([1 1],temp));
    if k==1
        new_output1 = [output1 0]; new_d1 = d1 + dis00;
        new_output2 = [output2 1]; new_d2 = d2 + dis11;
    else
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if d1+dis00 < d2+dis01;
            new_output1 = [output1 0]; new_d1=d1+dis00;
        else
            new_output1 = [output2 0]; new_d1=d2+dis01;
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if d1+dis11 < d2+dis10;
            new_output2 = [output1 1]; new_d2=d1+dis11;
        else
            new_output2 = [output2 1]; new_d2=d2+dis10;
        end
    end
    % memory update
    if k==1
        d1=new_d1; d2=new_d2;
        output1=new_output1; output2=new_output2;
    else
        d1=new_d1; d2=new_d2;
        output1=new_output1; output2=new_output2;
    end
end
output = [output1; output2];
d=[d1 d2];
ML_state_index=find(d==min(d));
result = output(ML_state_index(1),:);
