clear
EbN0dB_vector=10;
for snr_i=1:length(EbN0dB_vector)
    EbN0dB=EbN0dB_vector(snr_i);
    
    %%%Signal pulse design %%%%%%%%%%%%%%%%%%%%%%%%%%%
    Ts=1; L=16;
    t_step=Ts/L;
    pt=rcosine(1,L,'sqrt',0.5); N=length(pt);
    %We consider a square root raised cosine pulse with a roll-off factor=0.5 to transmit each bit in the bit stream. Regarding rcosine( ), refer to  1.D of Chapter 20.
    
    %%% Calculation of Signal (bit in case of BPSK) Energy %%%%%%%%%%%%%%%%%%%%%%%
    Eb=sum(pt.^2)*t_step ;
    % We will go through the same process in tx_sig_gen.m in 2.B of Chapter 20 to generate the transmit signal. Each bit is changed into a discrete unit impulse if bit is ¡®1¡¯ and its inverted version if bit is¡¯0¡¯, and then the discrete unit impulse (or its inverted version) is convolved with the shaping pulse ¡®pt¡¯ which is set above. Summing up, this is equivalent to transmitting ¡®pt¡¯ if bit is ¡®1¡¯ and ¡®-pt¡¯ if bit is ¡®0¡¯. Consequently, the bit energy Eb is equal to the energy of ¡®pt¡¯. Refer to 3.A of Chapter 17 regarding how to numerically calculate the energy of the sampled vector of a signal.
    
    %%%% N0 setting part %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    EbN0=10^(EbN0dB/10); %Conversion into linear scale.
    N0= Eb/EbN0 ; % Eb and EbN0 have been set already and EbN0 means Eb/N0.
    % In the two lines above, be sure not to fill in the specific solution for EbN0dB=100. Fill in the functional forms so that EbNO and N0 can change accordingly if we set EbN0dB to any different value.
    
    v_n=N0/(2*t_step);
    
    sum_Ne=0;  % Initialize the number of total errors
    N_frame=0;  % Number of frames for simulation
    
    while  sum_Ne <1
        
        %%%%%%%%%<2. 100 bit (binary symbol) generation>%%%%%%%%%%%%%%%%%%%%
        Ns=100;
        data_bit=(rand(1,Ns)>0.5);
        
        %%%%%%%%%<3. Unipolar to Bipolar (amplitude modulation)>%%%%%%%%%%%%%%
        amp_modulated=2*data_bit-1; % 0=> -1,  1=>1
        
        %%%%%%%%%<4. Impulse modulation >%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        impulse_modulated=[];
        for n=1:Ns
            delta_signal= [amp_modulated(n)  zeros(1, L-1)];
            impulse_modulated=[impulse_modulated  delta_signal];
        end
        
        %%%%%%%%<5.Pulse shaping (Transmitter filtering)>%%%%%%%%%%
        tx_signal=conv(impulse_modulated, pt);
        
        %%%%%%< Noise sample generation >%%%%%%%%%%%%%%%%%%%%%
        n_samples=sqrt(v_n)*randn(1,length(tx_signal));%Generate n[k]
        
        %%%%%%<Generation of received signal sample>%%%%%%%%%%%%
        r_samples = tx_signal + n_samples;
        
        carrier_wave=cos(2*pi*3.2*(1:length(tx_signal))*t_step); % ??
        passband_tx_signal=tx_signal.*carrier_wave;         % ??
        r_samples_pass = passband_tx_signal + n_samples;    % ??

        local_carrier=cos(2*pi*3.2*(1:length(tx_signal))*t_step);
        mult_out=r_samples_pass.*local_carrier;

        z_samples=conv(mult_out,pt);  %Matched filter
        
        
        estimated_data_bit= (z_samples(N+((1:Ns)-1)*L) >0 ); % Data bit estimation in 2.H
        
        Ne=sum(estimated_data_bit~=data_bit);  %  ?
        sum_Ne=sum_Ne +Ne;  %  ?
        N_frame=N_frame+1;
    end
    
    %Calculate the BER by the definition, i.e., BER= Total number of bit errors /Total number of transmitted bits
    Total_bit=N_frame*Ns;
    BER=sum_Ne/Total_bit
    BER_exact=0.5*erfc(sqrt(EbN0))
    
    BER_vector(snr_i)=BER;
    BER_exact_vector(snr_i)=BER_exact;
end
figure
semilogy(EbN0dB_vector, BER_vector);
hold on
semilogy(EbN0dB_vector, BER_exact_vector, 'r');
xlabel('Eb/N0 [dB]');ylabel('BER');legend('Simulated', 'Theory');grid on;hold off;

