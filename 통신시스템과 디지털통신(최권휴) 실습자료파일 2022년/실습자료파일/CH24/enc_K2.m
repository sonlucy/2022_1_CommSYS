function coded = enc_K2(data_bit)
global E;E=0;
K=2;
Nb=length(data_bit);
D=zeros(1,2); % Reset 2 bit memory.
coded=[]; 
for n=1:Nb  % n = clock index. Since one bit comes in at each clock epoch, Nb number of clocks will be required.
  D(1)=data_bit(n);
  %%%%%%%output (u1, u2) generation logic part %%%%%%
  u1=D(1);
  u2=xor(D(1),D(2));

  %%%%%%Coded bit concatenation %%%%%%%
  coded=[coded u1 u2];

  %%%%%%%% memory update part %%%%%%%
  D(2)=D(1);  %At each clock epoch, the bit in the memory shits, i.e.,D(1) => D(2)
end
