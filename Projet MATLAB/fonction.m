function [xm,t,Xm,f]=fonction(fm,am,v0,B,M,T)
    k=5500
    dt=0.01;
    t=0:dt:T-dt;
    xm=cos(2*pi*fm*t + k*am/v0  *sin(2*pi*v0*t));
    vm=
    [Xm,f]=TransFourier(xm,t);
    subplot(2,2,1)
    plot(t,xm)
    legend('signal xm(t)')
    subplot(2,2,2)
    plot(t,vm)
    hold on;
    plot(t,fm+k*am*sin(2*pi*v0*t))
    legend('fréquence instantannée estimée','fréquence instannée théorique')
    subplot(2,2,3)
    plot(f,Xm)
    subplot(2,2,4)
    