R = 18;     
L = 1.2;    
C = 1.5e-3; 

A = [0, 1/C; -1/L, -R/L]; 
B = [0; 1/L];
C_mat = [1, 0]; 
D = 0;

% Modellerin Oluşturulması
sys_ss = ss(A, B, C_mat, D);          % Durum-Uzayı Modeli
num = [1/(L*C)];
den = [1, R/L, 1/(L*C)];
G = tf(num, den);                     % Transfer Fonksiyonu Modeli

% Basamak Yanıtı Verilerinin Hesaplanması
[y_tf, t_tf] = step(G);               % Transfer fonksiyonu verileri
[y_ss, t_ss] = step(sys_ss);          % Durum-uzayı verileri

% Grafik Çizimi
figure;
plot(t_tf, y_tf, 'b', 'LineWidth', 2.5); % Mavi düz çizgi (Transfer Fonksiyonu)
hold on;
plot(t_ss, y_ss, 'r--', 'LineWidth', 2); % Kırmızı kesikli çizgi (Durum Uzayı)
grid on;

% Grafik Detayları ve Lejant (Sağ Üstte)
title('3.2. Transfer Fonksiyonu ve Durum Uzayı Yanıtı Karşılaştırması');
xlabel('Zaman (saniye)');
ylabel('v_c(t) (Volt)');

% Sağ üst köşeye hangi rengin ne olduğunu belirten açıklama ekleme
legend('Transfer Fonksiyonu', 'Durum-Uzayı Modeli', 'Location', 'northeast');