function s_hat=osic_zf_qpsk(r,H)

[Nr Nt]=size(H);
sym_index=1:Nt;
s_hat=zeros(Nt,1);
while Nt>0
    Hinv=pinv(H);
    T=sum(abs(Hinv').^2);
    [A B]=min(T);
    
    C=H(:,Nt); H(:,Nt)=H(:,B); H(:,B)=C;
    D=sym_index(Nt); sym_index(Nt)=sym_index(B);sym_index(B)=D;
    
    z=pinv(H)*r;
    s_hat(sym_index(Nt))=sign(real(z(Nt)))+ j* ??;
    r=r-H(:,Nt)*s_hat(sym_index(Nt));
    H=H(:,1:(Nt-1));
    Nt=Nt-1;
end
