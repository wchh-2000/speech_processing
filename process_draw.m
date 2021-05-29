function process_draw(y)
%yΪ��ͨ����16000*2
close all
fs=8000;  %ȡ��Ƶ��
duration=2;%¼��ʱ��2s
t=linspace(0,duration,duration*fs);
% ����¼�����ݲ���
figure
plot(t,y);
xlabel('ʱ��/s')
ylabel('ʱ����')

n=size(y,1);%n ���������
f=(0:n/2-1)/n*2;%��һ��������Ƶ�� ǰһ��Ƶ��
fd=f(2:2:end);
yd=y(2:2:end,:);%��ȡһ�� ������
Y=fft(y);
Yd=fft(yd);
Y=Y(1:n/2,:);%����ǰһ��Ƶ�ף���Ƶ��0-pi
Yd=Yd(1:n/4,:);
figure
subplot(221)
plot(f,abs(Y))
xlabel('���ֽ�Ƶ��(\times\pi rad)')
ylabel('����')
subplot(222)
plot(f,angle(Y))
xlabel('���ֽ�Ƶ��(\times\pi rad)')
ylabel('��λ')
subplot(223)
plot(fd,abs(Yd))
xlabel('���ֽ�Ƶ��(\times\pi rad)')
ylabel('�����������')
subplot(224)
plot(fd,angle(Yd))
xlabel('���ֽ�Ƶ��(\times\pi rad)')
ylabel('����������λ')