function yf=process_filter(y)
close all
%下面为IIR巴特沃斯滤波器设计
wp=0.16;%通带边界频率
ws=0.3;%阻带
Rp=0.42;%通带波纹系数
Rs=100;%最小阻带衰减
[N,wc]=buttord(wp,ws,Rp,Rs)
[num,den]=butter(N,wc);
%下面为FIR hanning滤波器设计
% N=50;
% wc=0.16;
% num=fir1(N,wc);% Hamming window 
% den=1;%FIR滤波器传递函数分母为1

figure(1)
freqz(num,den)
yf=filter(num,den,y);%滤波后
sound(yf,7000)
audiowrite('IIR滤波后.wav',yf,7000)

n=size(y,1);%n 采样点个数
f=(0:n/2-1)/n*2;%归一化的数字频率 前一半频谱
Y=fft(y);
Yf=fft(yf);
Y=Y(1:n/2,:);%画出前一半频谱，角频率0-pi
Yf=Yf(1:n/2,:);
figure(2)
% 绘制滤波前后频谱
subplot(221)
plot(f,20*log10(abs(Y)))
xlabel('数字角频率(\times\pi rad)')
ylabel('幅度(dB)')
subplot(222)
plot(f,angle(Y))
xlabel('数字角频率(\times\pi rad)')
ylabel('相位')
subplot(223)
plot(f,20*log10(abs(Yf)))
xlabel('数字角频率(\times\pi rad)')
ylabel('滤波后幅度(dB)')
subplot(224)
plot(f,angle(Yf))
xlabel('数字角频率(\times\pi rad)')
ylabel('滤波后相位')