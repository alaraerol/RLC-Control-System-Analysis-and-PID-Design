R = 18;
L = 1.2;
C = 1.5e-3;

num = [1];
den = [(L*C) (R*C) 1];
G = tf(num, den); 

kutuplar = pole(G);
sifirlar = zero(G);
disp('Kutuplar:'); disp(kutuplar);
disp('Sıfırlar:'); disp(sifirlar);
