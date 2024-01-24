% Save the m-file as same as the function name, i.e., save it as ¡®enc.m¡¯. 
function coded = enc_K3(data_bit)
global E;E=1;
Nb=length(data_bit);
D=zeros(1,3); % Reset 3 bit memory.
coded=[]; 
for n=1:Nb  % n = clock index. Since one bit comes in at each clock epoch, Nb number of clocks will be required.
  D(1)=data_bit(n);
  %%%%%%%output (u1, u2) generation logic part %%%%%%
  u1=xor(D(1),D(3));
  u2=xor(xor(D(1),D(2)),D(3));

  %%%%%%Coded bit concatenation %%%%%%%
  coded=[coded u1 u2];

  %%%%%%%% memory update part %%%%%%%
  D(3)=D(2);  %At each clock epoch, the bit in the memory shits, i.e., D(2)=>D(3).
  D(2)=D(1);  %At each clock epoch, the bit in the memory shits, i.e.,D(1) => D(2)
end
