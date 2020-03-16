clear;

[y,Fs] = audioread('handel.wav');%��ȡ����

info = audioinfo('handel.wav');%��ȡ������Ϣ
t = 0:seconds(1/Fs):seconds(info.Duration);
t = t(1:end-1);
distance1=500;%��һ���ϰ������ľ���Ϊ5KM
distance2=1500;%�ڶ����ϰ������ľ���Ϊ20KM
v_sound=340;%�����Ĵ����ٶ�340m/s
alpha1=0.2;%��һ���ŵ�˥��ϵ��
alpha2=0.3;%�ڶ����ŵ�˥��ϵ��
alpha3=0.5;%�������ŵ�˥��ϵ��

subplot(2,1,1);
plot(t,y);
title('�����ź�');
xlabel('ʱ��');
ylabel('����');
% y1=fft(y);%y1ΪƵ������
% y1=fftshift(y1);%���ٸ���Ҷ�任
% subplot(312);
% plot(abs(y1));
x = 1:1:73113;
y2=y(x);        %y2Ϊ�����ź�

% for temp=1:73113
%     if temp<distance1/v_sound
%        f=alpha1*y2(temp); 
%     end

temp=int64(Fs*distance2/v_sound);
x=temp+1:1:73113;
f=alpha1*y2(x)+alpha2*y2(x-int64(distance1/v_sound*Fs))+alpha3*y2(x-int64(distance2/v_sound*Fs));%��Ӧ���ʽ

subplot(2,1,2);
x=double(x);
plot(x/Fs,f);
xlim([4.00, 9.00]);
ylim([-1 ,1]);
title('�����ź�');
xlabel('ʱ��');
ylabel('����');

sound(y,Fs);%����ԭʼ����
pause(9);%�ȴ�9��ʹ���ַ���
sound(f,Fs);%���ű任������


