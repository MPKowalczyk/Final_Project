clear;
close;
clc;

fs=60;
dt=1/fs;
A=[1 0 dt 0 dt^2/2 0;0 1 0 dt 0 dt^2/2;0 0 1 0 dt 0;0 0 0 1 0 dt;0 0 0 0 1 0;0 0 0 0 0 1];
C=[1 0 0 0 0 0;0 1 0 0 0 0];
V=10/fs*eye(6);
W=100*eye(2);
y=get(0,'PointerLocation');
Ppri=A*100*eye(6)*A'+V;
xpri=A*[y(1) y(2) 0 0 0 0]';
Ppost=100*eye(6);
xpost=[y(1) y(2) 0 0 0 0]';
figure('units','normalized','outerposition',[0 0 1 1]);
xlabel('Wspó³rzêdna pozioma');
ylabel('Wspó³rzêdna pionowa');
title('Filtr Kalmana');
hold on;
grid on;
plot(y(1),y(2),'b+',xpost(1),xpost(2),'r+');
legend('Zmierzone po³o¿enie','Estymowane po³o¿enie');
axis([0 1400 0 800]);
while(1)
    y=get(0,'PointerLocation')';
    delta=y-C*xpri;
    S=C*Ppri*C'+W;
    K=Ppri*C'/S;
    xpost=xpri+K*delta;
    Ppost=Ppri-K*S*K';
    plot(y(1),y(2),'b+',xpost(1),xpost(2),'r+');
    Ppri=A*Ppost*A'+V;
    xpri=A*xpost;
    pause(dt);
end