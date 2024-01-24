% 각 라인의 결과를 볼 수 있도록 각 라인의 끝에 ';'를 추가하지 말 것.
clc;clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
A=3*rand(9,10)

[B C]=max(A)
[D E]=max(B)
 
Max=D
Position=[C(E)  E]
