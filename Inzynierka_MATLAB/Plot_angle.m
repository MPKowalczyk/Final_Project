figure;
plot(angle.Time,angle.Data(:,1),'b',angle.Time,angle.Data(:,2),'r');
title('Odpowiedü uk≥adu dla zadania nadπøania');
xlabel('Czas [s]');
ylabel('Kπt [^o]');
grid on;
legend('Pozycja obiektu','Pozycja kamery');
axis([0 3 0 80]);