%% Parameters of DC control
A_obj=1;
T=0.05;
dc=tf(A_obj,[T 1 0]);
K=1/4.5/T;
W_SIZE=1280;
cam_angle=140;
imp_90=2000;
imp_0=6000;
fs=60;
h=1/fs;
I_regulator=0.1;%0.05;
K_regulator=0.4;%0.1;
D_regulator=0.05;
I_D_regulator=3e-3;

%% Model of servomechanism for critical amplification
A=[0 1;-1/4/T^2 -1/T];
B=[0;1];
C=[1/4/T^2 0];
sys=ss(A,B,C,0);

%% Model in discrete domain
Ad=[(1+h/2/T)*exp(-h/2/T) h*exp(-h/2/T);-h/4/T^2*exp(-h/2/T) (1-h/2/T)*exp(-h/2/T)];
Bd=[-2*T*exp(-h/2/T)*(h+2*T)+4*T^2;h*exp(-h/2/T)];
Cd=[1/4/T^2 0];
sysd=ss(Ad,Bd,Cd,0,h);

%% Comparison
[x,t]=step(sys);
[xd,td]=step(sysd);
plot(t,x,'b');
hold on;
stairs(td,xd,'r');
title('Porównanie modeli');
xlabel('Czas [s]');
ylabel('Wartoœæ');
grid on;
legend('Model ci¹g³y','Model dyskretny');