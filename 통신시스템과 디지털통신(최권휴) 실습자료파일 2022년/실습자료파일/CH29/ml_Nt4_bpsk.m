function s_hat=ml_Nt4_bpsk(r,H)

s_candidate_set=[];
dist_set=[];

for b1_candidate=[-1 1]
    for b2_candidate=[-1 1]
        for b3_candidate=[-1 1]
            for b4_candidate=[-1 1]
                s_candidate=[b1_candidate b2_candidate b3_candidate b4_candidate]';
                r_candidate=H*s_candidate;
                dist= sum(abs(?-r_candidate).^2);
                
                s_candidate_set=[s_candidate_set s_candidate];
                %s_candidate�� s_candidate_set�� ���� �߰��ϸ鼭 ����
                dist_set=[dist_set dist];
                %dist�� dist_set�� ���ҷ� �߰��ϸ鼭 ����
            end
        end
    end
end

[A B]=min(dist_set);
s_hat=s_candidate_set(:,B);
