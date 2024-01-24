clear
randn(1,225); % XXX=�й� �� ���ڸ� ==225
load sampled_ft.mat 
t_step= t_vector(2) - t_vector(1); %���ð���

Fw30=sum(ft_vector.*exp(-j*30*t_vector))*t_step 
% �� ������ w=30���� Ǫ���� ��ȯ F(w) ��, F(30)�� ��ġ����(2�� ���� 1 ����)���� ������ ��
Fw70=sum(ft_vector.*exp(-j*70*t_vector))*t_step 
% �� ������ w=70���� Ǫ���� ��ȯ F(w) ��, F(70)�� ��ġ����(2�� ���� 1 ����)���� ������ ��
Fw200=sum(ft_vector.*exp(-j*200*t_vector))*t_step 
% �� ������ w=200���� Ǫ���� ��ȯ F(w) ��, F(200)�� ��ġ����(2�� ���� 1 ����)���� ������ ��