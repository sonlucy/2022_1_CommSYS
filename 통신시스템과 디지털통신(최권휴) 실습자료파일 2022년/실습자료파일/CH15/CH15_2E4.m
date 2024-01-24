clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
Nid=1225; % XXX= 자신의 학번 뒤 3자리
cnt=0;
Trials=0;
while cnt < Nid
    X1=sqrt(2)*randn+1 ;
    X2=sqrt(9)*randn-2 ;
    X3=sqrt(4)*randn+0 ;
    Y= X1+ 3*X2-2*X3 ;
    if Y >= 5
        cnt=cnt+1;
    end
    Trials=Trials+1;
end
P=cnt/Trials
