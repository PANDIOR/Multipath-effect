clear;
clc;
%常数
v_sound=340;%声音的传播速度340m/s
v_wave=3*10^8;%电磁波传播速度


%-----------------------参数设置区域--------------------------%
distance1=500;%第一个障碍物多出的距离   单位：m
distance2=1500;%第二个障碍物多出的距离  单位：m
freq=10000;%激励正弦信号的频率   单位：Hz
alpha1=0.8;%第一条信道衰减系数
alpha2=0.6;%第二条信道衰减系数
alpha3=0.7;%第三条信道衰减系数
v=v_sound;%选择传播方式
%------------------------------------------------------------%


TimeStart=0;%起始时间
dt=1/freq*0.001;%采样率
TimeEnd=5/freq;%终止时间
t=TimeStart:dt:TimeEnd;%进行采样
%激励函数：sin(t)为标准正弦函数
figure('name','多径效应基本模型');
plot(t,sin(2*pi*freq*t));
hold on;
f=alpha1*sin(2*pi*freq*t)+alpha2*sin(2*pi*freq*(t-distance1/v))+alpha3*sin(2*pi*freq*(t-distance2/v));%响应表达式
f=awgn(f,35);%加入高斯白噪声
plot(t,f);
xlim([0, 5/freq]);%只设定x轴的绘制范围
ylim([-2, 2]);%只设定y轴的绘制范围
xlabel('时间');
ylabel('幅度');
grid on;
title('激励为正弦函数的多径模型');
legend('发送信号','接收信号');