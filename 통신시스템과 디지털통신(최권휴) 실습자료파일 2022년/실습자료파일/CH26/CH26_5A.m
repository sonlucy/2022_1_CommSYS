clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
Nf=10;
Nc=16;T=10e-5;
f_delta=1/T;
t_step=T/Nc;
t_vector=0:t_step:(T-t_step); 
for k=0:(Nc-1)
    subcarrier=1/sqrt(T)*exp(j*2*pi*k*f_delta*t_vector);
    subcarrier_matrix(k+1,:)=subcarrier;    
    %OFDM변복조에 사용하기 위해 서브캐리어들을 subcarrier_matrix의 행들로 저장.
end
xt_frame=[];
for m=1:Nf
    s_vector=sign(rand(1,Nc)-0.5)+j*sign(rand(1,Nc)-0.5);
    
    xt=zeros(1,length(t_vector));
    for k=0:(Nc-1)
        s_k=s_vector(k+1);
        xt=xt+s_k*subcarrier_matrix(k+1,:);
    end
    xt_frame=[xt_frame xt];
end
