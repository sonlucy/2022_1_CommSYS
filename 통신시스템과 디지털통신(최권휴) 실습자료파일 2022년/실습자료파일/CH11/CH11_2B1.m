clear
randn(1,225); %
load sound_CH11.mat
t_vector=data(1,1:4000);
ft_vector=data(2, 1:4000 );
 
t_step=t_vector(1,2)-t_vector(1,1);
w_vector=[]; w_step=2*pi;
Fw_vector=[]; Hilbert_Fw_vector=[];
for w=(-2*pi*4000):w_step:(2*pi*4000)
    w_vector=[w_vector w];
    Fw=sum(ft_vector.*exp(-j*w*t_vector))*t_step;
    Fw_vector=[Fw_vector Fw];
    if w >0
        Hilbert_Fw=-j*Fw;
    else
        Hilbert_Fw=j*Fw;
    end
    Hilbert_Fw_vector=[Hilbert_Fw_vector Hilbert_Fw];
end
  
w_step=2*pi;
Hilbert_ft_vector=[];
for t=t_vector
    Hilbert_ft=1/(2*pi)*sum(Hilbert_Fw_vector.*exp(j*t*w_vector))*w_step;
    Hilbert_ft_vector=[Hilbert_ft_vector Hilbert_ft];
end
 
Data(1,:)=t_vector;
Data(2,:)=ft_vector;
save ft.mat Data
 
Data(1,:)=t_vector;
Data(2,:)=real(Hilbert_ft_vector);
save Hilbert_ft.mat Data

