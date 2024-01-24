% m-file 파일 이름을 function 이름과 일치시킬 것 즉, ‘enc.m’으로 저장.
function coded = enc(data_bit)
Nb=length(data_bit);
D=zeros(1,3); % Reset 3 bit memory.
coded=[]; 
for n=1:Nb  % n = 클럭 인덱스, 비트 당 한 클럭씩 들어오므로 Nb개의 클럭이 필요
  D(1)=data_bit(n);
  %%%%%%% 출력 (u1, u2) 합성 로직 부분 %%%%%%
  u1=xor(D(1),D(3));
  u2=xor(xor(D(1),D(2)),D(3));

  %%%%%%코딩된 bit를 순서대로 저장하는 부분 %%%%%%%
  coded=[coded u1 u2];

  %%%%%%%% 메모리 업데이트 부분 %%%%%%%
  D(3)=D(2);  %클럭에 동기(n->n+1로 증가하는 것을 의미)하여 D(2)=>D(3)로 이동
  D(2)=D(1);  %클럭에 동기하여 D(1) => D(2) 로 이동
end
