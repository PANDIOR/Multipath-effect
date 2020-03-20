clear;
clc;
[y,Fs] = audioread('handel.wav');%��ȡ����
info = audioinfo('handel.wav');%��ȡ������Ϣ
t = 0:seconds(1/Fs):seconds(info.Duration);
t = t(1:end-1);


%-----------------------������������--------------------------%
distance1=500;%��һ���ϰ������ľ���   ��λ��m
distance2=1500;%�ڶ����ϰ������ľ���  ��λ��m

alpha1=0.2;%��һ���ŵ�˥��ϵ��
alpha2=0.3;%�ڶ����ŵ�˥��ϵ��
alpha3=0.5;%�������ŵ�˥��ϵ��
%------------------------------------------------------------%


v_sound=340;%�����Ĵ����ٶ�340m/s
figure('position',[200,100,1000,700]);
subplot(3,1,1);
plot(t,y);
title('��Ƶ�����ź�');
xlabel('ʱ��');
ylabel('����');
f1=y;
f2=[zeros(floor(Fs*distance1/v_sound),1);y];
f3=[zeros(floor(Fs*distance2/v_sound),1);y];
maxsize=max([size(f1,1),size(f2,1),size(f3,1)]);
f=zeros(maxsize,1);
f(1:size(f1,1))=alpha1*f1+f(1:size(f1,1));
f(1:size(f2,1))=alpha2*f2+f(1:size(f2,1));
f(1:size(f3,1))=alpha3*f3+f(1:size(f3,1));
f=awgn(f,70);%�����˹����������ҿ������԰�70����10������һ�¸����� =��= ��
subplot(3,1,2);
x=1:maxsize;
plot(x/Fs,f,'-r');
xlim([-0.5, 14]);
title('��Ƶ�����ź�');
xlabel('ʱ��');
ylabel('����');
subplot(3,1,3);
xx=1:info.TotalSamples;
plot(xx/Fs,y);
hold on;
plot(x/Fs,f);
title('�ź��ص��Ա�ͼ');
xlabel('ʱ��');
ylabel('����');
xlim([-0.5, 14]);
sound(y,Fs);%����ԭʼ���֣�����Ҫ���Ļ�������ǰ���һ����%��ע�͵���
pause(9);%�ȴ�9��ʹ���ַ���
sound(f,Fs);%���ű任������


