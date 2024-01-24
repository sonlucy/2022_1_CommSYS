clear
rand(1XX); % XX= �ڽ��� �й� �� 2�ڸ�. mfile ����� ��������� �ݵ�� �߰� �� ��. 
Nsim=100;
xstep=0.01;
xmin=-5;
xmax=5;
x=xmin:xstep:xmax;
Number_of_partitions=(xmax-xmin)/xstep;
PartitionCenters=(xmin+xstep/2):xstep:(xmax-xstep/2);

CountAtEachPartition=zeros(1,Number_of_partitions);

for n=1:Nsim

    random_sample=randn;
    
    for k=1:Number_of_partitions

        kth_partition_left_end= x(k);  
        kth_partition_right_end=x(k+1); 

        if(kth_partition_left_end<=random_sample)&(random_sample<kth_partition_right_end)
            CountAtEachPartition(k)=CountAtEachPartition(k)+1;
        end
    end

end
Px=CountAtEachPartition/xstep/Nsim;
figure
plot(PartitionCenters,Px,'r')
grid on

