clear
randn(1,225); % XXX=학번 끝 세자리, 내용과 상관없는 부분, 그러나 꼭 추가 할 것.
fs=40000;
T=5;

r = audiorecorder(fs, 16, 1);
record(r); pause(T);stop(r); y=getaudiodata(r)';
recorded(1,:)=1/fs*(1:length(y));
recorded(2,:)=y';

save FM_record.mat recorded
pwelch(y,[],[],[],fs);
