figure;
plot(angle.Time,angle.Data(:,1),'b',angle.Time,angle.Data(:,2),'r');
title('Odpowied� uk�adu dla zadania nad��ania');
xlabel('Czas [s]');
ylabel('K�t [^o]');
grid on;
legend('Pozycja obiektu','Pozycja kamery');
axis([0 3 0 80]);