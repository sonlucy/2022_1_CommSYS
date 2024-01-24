clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
Nid=1225; %XXX = 자신의 학번 뒤 3자리
for n=1:Nid
    X1=sqrt(2)*randn+1 ;
    X2=sqrt(9)*randn-2 ;
    X3=sqrt(4)*randn+0 ;
    Y(n)= X1+3*X2-2*X3 ;
end
mY=sum(Y)/Nid %14장의 5.A 참조, 매트랩의 Smean()s 함수를 사용하지 말 것.
vY=(sum(Y.^2)/Nid) -mY^2 %14장의 5.B 참조, 매트랩의 svar()u 함수를 사용하지 말 것.
