clear
randn(1,225); % XXX=�й� �� ���ڸ�, ����� ������� �κ�, �׷��� �� �߰� �� ��.
load st_and_rt.mat
a11=sum(s1t.*p1t)*tstep;% a11�� ��ġ���� ����, 2���� ���� 1 ����
a12=sum(s1t.*p2t)*tstep ;
s1=[a11,a12]

a21=sum(s2t.*p1t)*tstep;
a22=sum(s2t.*p2t)*tstep;
s2=[a21,a22]

a31=sum(s3t.*p1t)*tstep;
a32=sum(s3t.*p2t)*tstep;
s3=[a31,a32]

a41=sum(s4t.*p1t)*tstep;
a42=sum(s4t.*p2t)*tstep;
s4=[a41,a42]