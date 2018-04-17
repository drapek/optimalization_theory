clear;
syms x a b c lam; % symbolic variables

f0 = x^2 + a;  % funkcja celu
f1 = (x - b) * (x - c);

% Krok 1: budowa funkcji La Grange'a
L = f0 + lam * f1
L = collect(L, x)

% Krok 2: liczymy pochodn� f. Grange'a 
dLdx = diff(L, x)

% Krok 3: rozwi�zanie pochodnej do 0, ze wzgl�du na X
xmin = solve(dLdx == 0, x)
xmin = simplify(xmin) % uproszczenie r�wnania

% Krok 4: wstaw x_min do Lagrangean'u
g = subs(L, x, xmin) % substitute 
g = simplify(g) % jest to f. dualna

g1 = diff(g, lam)
g2 = simplify(diff(g1, lam))


% konkretny przypadek
%a = 1, b = 2, c = 4

g1s = subs(g1, {a, b, c}, {1, 2, 4}); % gdzie s oznacza podstawione warto�ci
lam_s = solve(g1s == 0, lam >= 0, lam); % lambda z gwiazdk�
x_s = subs(xmin, {lam, b, c}, {lam_s, 2, 4}); % x_s = x z gwiazdk�

p_s = subs(f0, {x, a}, {x_s, 1}); % wyznaczam p z gwiazdk�

d_s = subs(g, {lam, a, b, c}, {lam_s, 1, 2, 4}); % silna dualno�� jest gdy d_s = p_s


% Rozwi�zanie tego samego u�ywaj�c warunk�w KKT
% Ska�daj� si� one z 4 element�w: ograniczenia pierwotne, ograniczenia
% dualne, ograniczenia skro�ne, warunek na delta L(x, lam, ni) = 0

f1s = subs(f1, {b, c}, {2, 4});
dLdxs = subs(dLdx, {b, c}, {2, 4});
[xKKT, lamKKT] = solve(f1s <= 0, ... % ograniczeina pierwotne 
                       lam >= 0, ... % ograniczenia dualne
                       lam * f1s == 0, ...
                       dLdxs == 0, ...
                       [x, lam] ...% chc� to rozwi�za� ze wzgl�du na x i lambda
                       ); % rozwi�zywanie uk�adu r�wna� i nier�wno�ci
                   
                   
% Wykresy jako podsumowanie
f0s = subs(f0, a, 1);
gs = subs(g, {a, b, c}, {1, 2, 4});

figure(1)
hold on
grid on
fplot(f0s, [0 5])
hold off

figure(2)
hold on
grid on
fplot(gs, [0 5]) % to jest funcja dualna, a na osi odci�tych s� lambdy
hold off