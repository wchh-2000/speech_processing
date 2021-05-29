function y=record()
close all
fs=7000;  %取样频率
duration=2;%录音时间2s
disp('按任意键开始录音')
pause
recObj = audiorecorder(fs,8,2);%抽样率fs 8位数据 2通道
disp('开始录音')
recordblocking(recObj, duration);% 录音录2秒钟
disp('结束录音');
% 回放录音数据
play(recObj);
% 获取录音数据
y = getaudiodata(recObj);
audiowrite('原始录音.wav',y,fs)


