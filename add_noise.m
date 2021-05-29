function yn=add_noise(y)
fs=7000;
n=size(y,1);%n 采样点个数
%noise=0.1*randn(n,1);%加白噪声
fn=1000;
n=10*cos(fn*[1:n])';%加单频噪声
noise2=[n n];
yn=y+noise2;
sound(yn,fs)
audiowrite('加单频噪声后录音.wav',yn,fs)