function process_draw(y)
%y为两通道，16000*2
close all
fs=8000;  %取样频率
duration=2;%录音时间2s
t=linspace(0,duration,duration*fs);
% 绘制录音数据波形
figure
plot(t,y);
xlabel('时间/s')
ylabel('时域波形')

n=size(y,1);%n 采样点个数
f=(0:n/2-1)/n*2;%归一化的数字频率 前一半频谱
fd=f(2:2:end);
yd=y(2:2:end,:);%抽取一半 降采样
Y=fft(y);
Yd=fft(yd);
Y=Y(1:n/2,:);%画出前一半频谱，角频率0-pi
Yd=Yd(1:n/4,:);
figure
subplot(221)
plot(f,abs(Y))
xlabel('数字角频率(\times\pi rad)')
ylabel('幅度')
subplot(222)
plot(f,angle(Y))
xlabel('数字角频率(\times\pi rad)')
ylabel('相位')
subplot(223)
plot(fd,abs(Yd))
xlabel('数字角频率(\times\pi rad)')
ylabel('降采样后幅度')
subplot(224)
plot(fd,angle(Yd))
xlabel('数字角频率(\times\pi rad)')
ylabel('降采样后相位')