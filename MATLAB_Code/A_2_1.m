R = 18;
L = 1.2;
C = 1.5e-3;

num = [1];
den = [(L*C) (R*C) 1];
G = tf(num, den); 

figure;
impulse(G);
grid on;
title('Birim İmpuls Yanıtı');
xlabel('Zaman');
ylabel('v_c(t) (Volt)');