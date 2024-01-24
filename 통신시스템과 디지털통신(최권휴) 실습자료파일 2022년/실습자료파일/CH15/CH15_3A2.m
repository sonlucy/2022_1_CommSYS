clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
M=50;
Nid=1225; % XXX= �ڽ��� �й� �� 3�ڸ�
rand(Nid); % mfile ����� ��������� �ݵ�� �߰� �� ��.
Nsim=Nid*100;

Possible_Y=M:1:6*M ;  % ���� 3.A1�� �信 ���� Y�� �ִ밪�� ?�� �����ÿ�.
count=zeros(1,length(Possible_Y));

for n=1:Nsim
   for ii=1:M
      X(ii)=ceil((rand^2)*6);
   end
   Y=sum(X); 

   for k=1:length(Possible_Y)
      if Y==Possible_Y(k)
        count(k)=count(k)+1;
      end
   end
end
P_Y=count/Nsim;
plot(Possible_Y,P_Y)
xlabel('Y')
ylabel('Pr[Y]')
