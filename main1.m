clear;
clc;
%����
v_sound=340;%�����Ĵ����ٶ�340m/s
v_wave=3*10^8;%��Ų������ٶ�


%-----------------------������������--------------------------%
distance1=500;%��һ���ϰ������ľ���   ��λ��m
distance2=1500;%�ڶ����ϰ������ľ���  ��λ��m
freq=10000;%���������źŵ�Ƶ��   ��λ��Hz
alpha1=0.8;%��һ���ŵ�˥��ϵ��
alpha2=0.6;%�ڶ����ŵ�˥��ϵ��
alpha3=0.7;%�������ŵ�˥��ϵ��
v=v_sound;%ѡ�񴫲���ʽ
%------------------------------------------------------------%


TimeStart=0;%��ʼʱ��
dt=1/freq*0.001;%������
TimeEnd=5/freq;%��ֹʱ��
t=TimeStart:dt:TimeEnd;%���в���
%����������sin(t)Ϊ��׼���Һ���
figure('name','�ྶЧӦ����ģ��');
plot(t,sin(2*pi*freq*t));
hold on;
f=alpha1*sin(2*pi*freq*t)+alpha2*sin(2*pi*freq*(t-distance1/v))+alpha3*sin(2*pi*freq*(t-distance2/v));%��Ӧ���ʽ
f=awgn(f,35);%�����˹������
plot(t,f);
xlim([0, 5/freq]);%ֻ�趨x��Ļ��Ʒ�Χ
ylim([-2, 2]);%ֻ�趨y��Ļ��Ʒ�Χ
xlabel('ʱ��');
ylabel('����');
grid on;
title('����Ϊ���Һ����Ķྶģ��');
legend('�����ź�','�����ź�');