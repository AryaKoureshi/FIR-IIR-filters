close all; clear all; clc;
load("signals.mat")
fs=100;
a=1;
b=0.1.*ones(1,10);
freqz(b,a);
fvtool(b,a);
f1=figure(Name='orgSignals',NumberTitle='off');
f2=figure(Name='FFT_orgSignals',NumberTitle='off');
f3=figure(Name='Filtered',NumberTitle='off');
f4=figure(Name='Filtered_FFT',NumberTitle='off');
for i=1:length(signals)
    if signals(i).type == 'hs'
        if i>10
            c=i-5;
        else
            c=i;
        end
        L=length(signals(i).value);
        f = fs*(0:(L/2))/L;

        figure(f1);
        subplot(10,1,c)
        x=signals(i).value;
        plot(x)
        hold on
        title(signals(i).name + "-" + signals(i).number)

        figure(f2);
        subplot(10,1,c)
        y1=fft(x);
        P2=abs(y1/L);
        P1=P2(1:L/2+1);
        P1(2:end-1)=2*P1(2:end-1);
        stem(f,P1,'.','LineStyle','none')
        hold on
        title(signals(i).name + "-" + signals(i).number)
        xlabel('f (Hz)');
        
        figure(f3);
        subplot(10,1,c)
        yy=filter(b,a,x);
        plot(yy);hold on;
        title(signals(i).name + "-" + signals(i).number)

        figure(f4)
        subplot(10,1,c)
        yy1=fft(yy);
        P2=abs(yy1/L);
        P1=P2(1:L/2+1);
        P1(2:end-1)=2*P1(2:end-1);
        stem(f,P1,'.','LineStyle','none')
        hold on
        title(signals(i).name + "-" + signals(i).number)
        xlabel('f (Hz)');

    else signals(i).type == 'ls'
        if i>10
            c=i-10;
        else
            c=i-5;
        end

        L=length(signals(i).value);
        f = fs*(0:(L/2))/L;

        figure(f1);
        subplot(10,1,c)
        x=signals(i).value;
        plot(x)
        hold on

        figure(f2);
        subplot(10,1,c)
        y1=fft(x);
        P2=abs(y1/L);
        P1=P2(1:L/2+1);
        P1(2:end-1)=2*P1(2:end-1);
        stem(f,P1,'.','LineStyle','none')
        hold on
        title(signals(i).name + "-" + signals(i).number)
        xlabel('f (Hz)');

        figure(f3);
        subplot(10,1,c)
        yy=filter(b,a,x);
        plot(yy);hold on;

        figure(f4)
        subplot(10,1,c)
        yy1=fft(yy);
        P2=abs(yy1/L);
        P1=P2(1:L/2+1);
        P1(2:end-1)=2*P1(2:end-1);
        stem(f,P1,'.','LineStyle','none')
        hold on
        xlabel('f (Hz)');
    end
end