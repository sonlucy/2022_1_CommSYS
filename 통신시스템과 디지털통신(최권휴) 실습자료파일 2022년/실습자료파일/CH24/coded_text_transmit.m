clear;clc; rand(1,XX);  %XX = �ڽ��� �й� �� ���ڸ� 
load data_bits.mat; global E D;E=-1;D=-1; 

EncodedBits=DataBits;

r=ReceivedAfterAWGNchannel(EncodedBits);clear EncodedBits; % r= ������� ��ȣȭ�� ��Ʈ���� ���ҵ��� 1�� -1�� �ٲ���(BPSK����) ����� ���� ��. ��, ���Ž�ȣ.
z=(r>0);   % z= r�� �� ���ҵ��� ��ȣ�� �������� 0 �� 1�� �Ǻ�(BPSK����)�� ��.

DecodedBits=z;   

%���� �޽��� ��� ���� 
showMessage





