clear;
clc;
TimeStart=-pi;%��ʼʱ��
dt=0.01;%������
TimeEnd=10*pi;%��ֹʱ��
t=TimeStart:dt:TimeEnd;

distance1=500;%��һ���ϰ������ľ���Ϊ500m
distance2=1500;%�ڶ����ϰ������ľ���Ϊ1500m
v_sound=340;%�����Ĵ����ٶ�340m/s
v_wave=3*10^8;%��Ų������ٶ�

alpha1=0.8;%��һ���ŵ�˥��ϵ��
alpha2=0.3;%�ڶ����ŵ�˥��ϵ��
alpha3=0.5;%�������ŵ�˥��ϵ��

%����������sin(t)Ϊ��׼���Һ���
figure('name','�ྶЧӦ����ģ��');
plot(t,sin(t));
hold on;
f=alpha1*sin(t)+alpha2*sin(t-distance1/v_sound)+alpha3*sin(t-distance2/v_sound);%��Ӧ���ʽ
plot(t,f);

xlim([0, 30]);
ylim([-1.00 1.00]);
xlabel('ʱ��');
ylabel('����');
grid on;
title('����Ϊsin(t)�Ķྶģ��');
legend('�����ź�','�����ź�');