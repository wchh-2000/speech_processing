# speech_processing
 语音信号处理

1.	用MATLAB录音2秒(抽样率8000)，存储声音文件，获得时域音频数据y. 编写了record函数，输出音频数据y。

![image](https://user-images.githubusercontent.com/69345371/120089299-6825e300-c12b-11eb-88fe-1bedea52a5a7.png)

3.	将y做fft变换，画出幅度(abs)和相位(angle)谱。取y的8000个数据（2倍降采样）做fft变换，画出幅度和相位谱。process_draw（y）函数，音频数据y作为输入参数。降采样前后的频谱见下图

![image](https://user-images.githubusercontent.com/69345371/120089306-783dc280-c12b-11eb-9392-d32d57ffd68d.png)

3.	重新录制抽样率为7000的语音。对原始音频加单频噪声，即时域数据加上一个cos信号，其频谱为单频的脉冲。函数yn=add\_noise(y),输入为原始音频y,输出为加噪后音频。 设计IIR 巴特沃斯低通滤波器，对语音进行处理。yf=process_filter（y）函数，输入为处理前语音数据y，输出为处理后语音数据yf.

    利用freqz函数画出滤波器的频谱图，画出语音信号处理前后的频谱图，见下图
    
    IIR滤波器频谱图：
    
    ![image](https://user-images.githubusercontent.com/69345371/120089319-9f948f80-c12b-11eb-81ca-7f1c70552746.png)

    滤波前后信号频谱：
    
    ![image](https://user-images.githubusercontent.com/69345371/120089332-c05ce500-c12b-11eb-9b66-1be6191e0632.png)

运行示例：

![image](https://user-images.githubusercontent.com/69345371/120089383-3feab400-c12c-11eb-9755-14ffa304b7c1.png)
