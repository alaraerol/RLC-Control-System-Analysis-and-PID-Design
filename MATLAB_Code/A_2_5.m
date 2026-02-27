% Birim basamak yanıtı
[y,t] = step(G);

% Step bilgileri
info = stepinfo(G);

% Son değer
final_value = y(end);

figure;
plot(t, y, 'LineWidth', 1.5);
grid on;
xlabel('Zaman (s)');
ylabel('v_C(t)');
title('Birim Basamak Yanıtı ve Geçici Rejim Büyüklükleri');
hold on;

% Son değer çizgisi
yline(final_value, '--k');
text(t(end)*0.6, final_value, '  Son Değer');

% Tepe noktası (tp)
plot(info.PeakTime, info.Peak, 'ro');
text(info.PeakTime, info.Peak, '  Tepe Noktası');

% Yükselme süresi (tr)
xline(info.RiseTime, '--b');
text(info.RiseTime, final_value*0.2, '  Yükselme Süresi');

% Yerleşme süresi (ts)
xline(info.SettlingTime, '--r');
text(info.SettlingTime, final_value*0.9, '  Yerleşme Süresi');

% Maksimum aşım (Mp)
text(info.PeakTime, info.Peak*1.05, ...
    ['Mp = ' num2str(info.Overshoot,'%.1f') '%']);

hold off;
% Geçici rejim büyüklüklerini MATLAB ile hesaplama
info = stepinfo(G);

% Sonuçları ekrana yazdırma
disp('--- MATLAB stepinfo Sonuçları ---');
disp(['Yükselme Süresi (tr): ', num2str(info.RiseTime)]);
disp(['Tepe Zamanı (tp): ', num2str(info.PeakTime)]);
disp(['Maksimum Aşım (Mp): ', num2str(info.Overshoot), ' %']);
disp(['Yerleşme Süresi (ts): ', num2str(info.SettlingTime)]);