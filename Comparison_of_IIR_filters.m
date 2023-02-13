close all;clear all;clc;

n=10;
fs=100;
fc=10;

%% lowpass
[zb,pb,kb] = butter(n,(fc-5)/(fs/2),"low",'s');
[bb,ab] = zp2tf(zb,pb,kb);
[hb,wb] = freqs(bb,ab,4096);

[z1,p1,k1] = cheby1(n,0.5,(fc-5)/(fs/2),"low",'s');
[b1,a1] = zp2tf(z1,p1,k1);
[h1,w1] = freqs(b1,a1,4096);

[z2,p2,k2] = cheby2(n,30,(fc-5)/(fs/2),"low",'s');
[b2,a2] = zp2tf(z2,p2,k2);
[h2,w2] = freqs(b2,a2,4096);

figure(Name='lowpass',NumberTitle='off')
plot(wb*(fs/2),mag2db(abs(hb)),Color='blue')
hold on
plot(w1*(fs/2),mag2db(abs(h1)),Color='red')
plot(w2*(fs/2),mag2db(abs(h2)),Color='black')
axis([0 50 -110 5])
grid
xlabel('Frequency (Hz)')
ylabel('Attenuation (dB)')
legend('butter','cheby1','cheby2')

%% bandpass
[zb,pb,kb] = butter(10,[((fc-5)/(fs/2)) ((fc+5)/(fs/2))],"bandpass",'s');
[bb,ab] = zp2tf(zb,pb,kb);
[hb,wb] = freqs(bb,ab,4096);

[z1,p1,k1] = cheby1(10,0.5,[((fc-5)/(fs/2)) ((fc+5)/(fs/2))],"bandpass",'s');
[b1,a1] = zp2tf(z1,p1,k1);
[h1,w1] = freqs(b1,a1,4096);

[z2,p2,k2] = cheby2(10,30,[((fc-5)/(fs/2)) ((fc+5)/(fs/2))],"bandpass",'s');
[b2,a2] = zp2tf(z2,p2,k2);
[h2,w2] = freqs(b2,a2,4096);

figure(Name='bandpass',NumberTitle='off')
plot(wb*(fs/2),mag2db(abs(hb)),Color='blue')
hold on
plot(w1*(fs/2),mag2db(abs(h1)),Color='red')
plot(w2*(fs/2),mag2db(abs(h2)),Color='black')
axis([0 50 -110 5])
grid
xlabel('Frequency (Hz)')
ylabel('Attenuation (dB)')
legend('butter','cheby1','cheby2')

%% bandstop
[zb,pb,kb] = butter(10,[((fc-5)/(fs/2)) ((fc+5)/(fs/2))],"stop",'s');
[bb,ab] = zp2tf(zb,pb,kb);
[hb,wb] = freqs(bb,ab,4096);

[z1,p1,k1] = cheby1(10,0.5,[((fc-5)/(fs/2)) ((fc+5)/(fs/2))],"stop",'s');
[b1,a1] = zp2tf(z1,p1,k1);
[h1,w1] = freqs(b1,a1,4096);

[z2,p2,k2] = cheby2(10,30,[((fc-5)/(fs/2)) ((fc+5)/(fs/2))],"stop",'s');
[b2,a2] = zp2tf(z2,p2,k2);
[h2,w2] = freqs(b2,a2,4096);

figure(Name='bandstop',NumberTitle='off')
plot(wb*(fs/2),mag2db(abs(hb)),Color='blue')
hold on
plot(w1*(fs/2),mag2db(abs(h1)),Color='red')
plot(w2*(fs/2),mag2db(abs(h2)),Color='black')
axis([0 50 -110 5])
grid
xlabel('Frequency (Hz)')
ylabel('Attenuation (dB)')
legend('butter','cheby1','cheby2')

%% highpass
[zb,pb,kb] = butter(10,(fc+5)/(fs/2),"high",'s');
[bb,ab] = zp2tf(zb,pb,kb);
[hb,wb] = freqs(bb,ab,4096);

[z1,p1,k1] = cheby1(10,0.5,(fc+5)/(fs/2),"high",'s');
[b1,a1] = zp2tf(z1,p1,k1);
[h1,w1] = freqs(b1,a1,4096);

[z2,p2,k2] = cheby2(10,30,(fc+5)/(fs/2),"high",'s');
[b2,a2] = zp2tf(z2,p2,k2);
[h2,w2] = freqs(b2,a2,4096);

figure(Name='highpass',NumberTitle='off')
plot(wb*(fs/2),mag2db(abs(hb)),Color='blue')
hold on
plot(w1*(fs/2),mag2db(abs(h1)),Color='red')
plot(w2*(fs/2),mag2db(abs(h2)),Color='black')
axis([0 50 -110 5])
grid
xlabel('Frequency (Hz)')
ylabel('Attenuation (dB)')
legend('butter','cheby1','cheby2')