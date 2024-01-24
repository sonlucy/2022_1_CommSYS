clear
rand(1225); % XXX=�ڽ��� �й� �� 3�ڸ�. m-file ����� ��������� �ݵ�� �߰��� ��.
Ts=1;
tstep=Ts/10000;
tvector=0:tstep:Ts;

Delta_f=1/Ts;
f1=Delta_f;
f2=2*Delta_f;
f3=3*Delta_f;

x2t=cos(2*pi*f2*tvector);
E2=sum(x2t.^2)*tstep;  % ��ġ����(2���� 1 ����)
p2t=x2t/sqrt(E2); % �ι�° �������� ��ȣ�� ���� ����

% ��ȣ ���� ���� p1t ���� (= ù��° �������� ��ȣ�� ���� ���� )
x1t=cos(2*pi*f1*tvector);
E1=sum(x1t.^2)*tstep;
p1t=x1t/sqrt(E1);
% ��ȣ ���� ���� p3t ���� (= ����° �������� ��ȣ�� ���� ���� )
x3t=cos(2*pi*f3*tvector);
E3=sum(x3t.^2)*tstep;
p3t=x3t/sqrt(E3);

rt=cos(1.532*tvector*pi ); % (�� 17.3) �Ǵ� (�� 17.7)

% (�� 17.4)���� ���� �� 8-ary ��ȣ�� ���� ���� ��ǥ ����.
s1t_in_vector_space=[-2,-1,5];  %=s1
s2t_in_vector_space=[1,-2,-3];
s3t_in_vector_space=[0.5,4,2];
s4t_in_vector_space=[3,-1,-1];
s5t_in_vector_space=[-1,-4,3];
s6t_in_vector_space=[1,3,-0.5];
s7t_in_vector_space=[-1,-6,3];
s8t_in_vector_space=[-2,-3,1]; 

%��(17.6)�� ��Ÿ�� ���� ����� ��ġ����(2���� 1 ����)���� ����.
Z1=sum(rt.*p1t)*tstep;
Z2=sum(rt.*p2t)*tstep;
Z3=sum(rt.*p3t)*tstep;
rt_in_vector_space=[Z1,Z2,Z3];  % = (�� 17.5)�� Z

% ���� 2.C3���� ������ ����� ��Ʈ������ ����. m-file �ۼ��� �ͼ����� ������ command window���� �Ÿ��� �ϳ��� ����Ͽ��� ������.
ED_rt_s1t=sum(abs(rt_in_vector_space  -  s1t_in_vector_space ).^2); % ���Ͱ������� rt�� s1t�� ��Ŭ���� �Ÿ��� ����
ED_rt_s2t=sum(abs(rt_in_vector_space- s2t_in_vector_space).^2);
ED_rt_s3t=sum(abs(rt_in_vector_space- s3t_in_vector_space).^2);
ED_rt_s4t=sum(abs(rt_in_vector_space- s4t_in_vector_space).^2);
ED_rt_s5t=sum(abs(rt_in_vector_space- s5t_in_vector_space).^2);
ED_rt_s6t=sum(abs(rt_in_vector_space- s6t_in_vector_space).^2);
ED_rt_s7t=sum(abs(rt_in_vector_space- s7t_in_vector_space).^2);
ED_rt_s8t=sum(abs(rt_in_vector_space- s8t_in_vector_space).^2);

% ���� 2.C4���� ������ ����� ��Ʈ������ ����. m-file �ڵ��� �ͼ����� ������ ���� 8���� �Ÿ��� �������� ���� ���Ͽ� �Ǻ��Ͽ��� ������.
[T1 T2]=min([ED_rt_s1t, ED_rt_s2t, ED_rt_s3t, ED_rt_s4t, ED_rt_s5t, ED_rt_s6t, ED_rt_s7t, ED_rt_s8t]);
T2
