function s_hat=zf_qpsk(r,H)
z=pinv(?)*r;
s_hat=sign(real(z))+ j*?; 
