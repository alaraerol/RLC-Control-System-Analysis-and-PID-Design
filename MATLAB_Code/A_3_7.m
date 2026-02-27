%  KKF matrisleri
A = [0 1; -555.56 -15];
B = [0; 1];
C = [555.56 0];

% 1. Kontrol Edilebilirlik Matrisi ve Rankı
Co = ctrb(A, B);
rank_Co = rank(Co);

% 2. Gözlemlenebilirlik Matrisi ve Rankı
Ob = obsv(A, C);
rank_Ob = rank(Ob);

% Sonuçları görüntüle
disp('Kontrol Edilebilirlik Matrisi (Co):'), disp(Co)
disp(['Co Rankı: ', num2str(rank_Co)])

disp('Gözlemlenebilirlik Matrisi (Ob):'), disp(Ob)
disp(['Ob Rankı: ', num2str(rank_Ob)])