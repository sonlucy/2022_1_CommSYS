function s_hat=sic_zf_bpsk(r,H)

[Nr Nt]=size(H);
s_hat=zeros(Nt,1); % s_hat ÃÊ±âÈ­

while Nt>0
    z=pinv(H)*r;
    s_hat(Nt)=sign(real(z(Nt)));
    r=r- H(:,Nt)*s_hat(Nt);  %or r=r-H*[zeros(Nt-1, 1); s_hat(Nt)]; 
    H=H(:,1:(Nt-1));
    Nt=Nt-1;
end
