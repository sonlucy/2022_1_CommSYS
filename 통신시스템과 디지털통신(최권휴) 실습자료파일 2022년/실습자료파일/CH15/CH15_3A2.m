clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
M=50;
Nid=1225; % XXX= 자신의 학번 뒤 3자리
rand(Nid); % mfile 내용과 상관없으나 반드시 추가 할 것.
Nsim=Nid*100;

Possible_Y=M:1:6*M ;  % 문제 3.A1의 답에 따라 Y의 최대값을 ?에 넣으시오.
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
