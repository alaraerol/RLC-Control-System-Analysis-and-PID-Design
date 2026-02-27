% RLC Sistemi Transfer Fonksiyonu
num = [555.56];
den = [1 15 555.56];
sys_open = tf(num, den); % Açık çevrim sistem

% PID Katsayıların
Kp = 4.1614;
Ki = 45.3728;
Kd = 0.0882;
C = pid(Kp, Ki, Kd);

% Kapalı Çevrim Sistem (PID ile)
sys_closed = feedback(C*sys_open, 1);

% 5V Referans Girişi İçin Zaman Yanıtı
t = 0:0.005:2; % Grafiğin hızı net görünsün diye 2 saniye yeterli
v_ref = 5;     % Referans Gerilimi

[y_open, t] = step(v_ref * sys_open, t);    % Açık Çevrim Yanıtı (PID'siz)
[y_closed, t] = step(v_ref * sys_closed, t); % Kapalı Çevrim Yanıtı (PID'li)

% Grafik Çizimi
figure;
plot(t, y_closed, 'b', 'LineWidth', 2); hold on; % PID'li yanıt (Mavi)
plot(t, y_open, 'r--', 'LineWidth', 2);         % PID'siz yanıt (Kırmızı kesikli)
line([0 t(end)], [v_ref v_ref], 'Color', 'g', 'LineStyle', ':', 'LineWidth', 2); % Referans (Yeşil nokta)

% Grafik Düzenlemeleri
title('PID Denetleyici Performans Analizi (5V Referans Takibi)');
xlabel('Zaman (saniye)');
ylabel('Kondansatör Gerilimi (Volt)');
legend('Kapalı Çevrim (PID)', 'Açık Çevrim (Denetleyicisiz)', 'Referans Değeri (5V)');
grid on;
axis([0 0.5 0 6]); % İlk 0.5 saniyedeki hızı görmek için eksen ayarı