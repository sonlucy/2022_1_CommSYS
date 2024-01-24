clear
randn(1,XXX); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
load handel
t_step=1/Fs;
t=0:t_step:(length(y)-1)*t_step;
tone=sin(2*pi*3.Xe3*t); % e.g.,) sin(2*pi*3.5e3*t) if the last digit of the student ID number is 5.
y_plus_tone=y' +tone;
figure
pwelch(y_plus_tone,[],[],[],Fs)
