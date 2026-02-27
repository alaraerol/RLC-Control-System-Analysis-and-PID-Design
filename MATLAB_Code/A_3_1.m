R = 18;        
L = 1.2;       
C = 1.5e-3;    

num = [1];
den = [L*C R*C 1];

G = tf(num, den);

% Durum-uzayı matrislerinin elde edilmesi
[A, B, C_mat, D] = tf2ss(num, den);

% Matrislerin ekrana yazdırılması
disp('Durum-Uzayı Matrisleri:');
disp('A ='); disp(A);
disp('B ='); disp(B);
disp('C ='); disp(C_mat);
disp('D ='); disp(D);