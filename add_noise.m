function yn=add_noise(y)
fs=7000;
n=size(y,1);%n ���������
%noise=0.1*randn(n,1);%�Ӱ�����
fn=1000;
n=10*cos(fn*[1:n])';%�ӵ�Ƶ����
noise2=[n n];
yn=y+noise2;
sound(yn,fs)
audiowrite('�ӵ�Ƶ������¼��.wav',yn,fs)