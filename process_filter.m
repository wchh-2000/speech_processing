function yf=process_filter(y)
close all
%����ΪIIR������˹�˲������
wp=0.16;%ͨ���߽�Ƶ��
ws=0.3;%���
Rp=0.42;%ͨ������ϵ��
Rs=100;%��С���˥��
[N,wc]=buttord(wp,ws,Rp,Rs)
[num,den]=butter(N,wc);
%����ΪFIR hanning�˲������
% N=50;
% wc=0.16;
% num=fir1(N,wc);% Hamming window 
% den=1;%FIR�˲������ݺ�����ĸΪ1

figure(1)
freqz(num,den)
yf=filter(num,den,y);%�˲���
sound(yf,7000)
audiowrite('IIR�˲���.wav',yf,7000)

n=size(y,1);%n ���������
f=(0:n/2-1)/n*2;%��һ��������Ƶ�� ǰһ��Ƶ��
Y=fft(y);
Yf=fft(yf);
Y=Y(1:n/2,:);%����ǰһ��Ƶ�ף���Ƶ��0-pi
Yf=Yf(1:n/2,:);
figure(2)
% �����˲�ǰ��Ƶ��
subplot(221)
plot(f,20*log10(abs(Y)))
xlabel('���ֽ�Ƶ��(\times\pi rad)')
ylabel('����(dB)')
subplot(222)
plot(f,angle(Y))
xlabel('���ֽ�Ƶ��(\times\pi rad)')
ylabel('��λ')
subplot(223)
plot(f,20*log10(abs(Yf)))
xlabel('���ֽ�Ƶ��(\times\pi rad)')
ylabel('�˲������(dB)')
subplot(224)
plot(f,angle(Yf))
xlabel('���ֽ�Ƶ��(\times\pi rad)')
ylabel('�˲�����λ')