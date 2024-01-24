function s_hat=zf_bpsk(r,H)
z=pinv(?)*r;
s_hat=sign(real(z));
