function s_hat=ml_Nt2_bpsk(r,H)

s_candidate_set=[];
dist_set=[];

for b1_candidate=[-1 1]
    for b2_candidate=[-1 1]
                s_candidate=[b1_candidate b2_candidate]';
                r_candidate=H*s_candidate;
                dist= sum(abs(r-r_candidate).^2);
                
                s_candidate_set=[s_candidate_set s_candidate];
                %Add s_candidate as a new column of s_candidate_set
                dist_set=[dist_set dist];
                %Add dist as an new element of dist_set

    end
end

[A B]=min(dist_set);
s_hat=s_candidate_set(:,B);
