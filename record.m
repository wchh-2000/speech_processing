function y=record()
close all
fs=7000;  %ȡ��Ƶ��
duration=2;%¼��ʱ��2s
disp('���������ʼ¼��')
pause
recObj = audiorecorder(fs,8,2);%������fs 8λ���� 2ͨ��
disp('��ʼ¼��')
recordblocking(recObj, duration);% ¼��¼2����
disp('����¼��');
% �ط�¼������
play(recObj);
% ��ȡ¼������
y = getaudiodata(recObj);
audiowrite('ԭʼ¼��.wav',y,fs)


