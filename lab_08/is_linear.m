function y = is_linear(f)
    % Aby funkcja by�a linowa to musi spe�ania� 2 za�o�enia
    % za�1. f(ax) = a * f(x)
    % za�2. f(x+y) = f(x) + f(y)
    
    x1 = rand(1);
    x2 =  rand(1);
    x3 =  rand(1);
    x4 =  rand(1);
    a =  rand(1);
    
    % Sprawd� za�o�enie 1
    f_ax = f(a * x1, a * x2, a * x3, a * x4);
    af_x = a * f(x1, x2, x3, x4);
    % Poniewa� mamy doczynienia z obliczeniami komputerowymi, to musimy
    % za�o�y� za jak� dok�adno�ci� por�wnujemy liczby. Poni�sza instrukcja
    % zostanie uruchomiona gdy f_ax i af_x b�d� od siebie r�ne. 
    if ~(abs(f_ax - af_x) < 1e4*eps(min(abs(f_ax),abs(af_x))))
        fprintf('Zal1. is not fullfilled. \n')
        y = 0;
        return;
    end
    
    % Sprawd� za�o�enie 2
    f_x_plus_y  =  f(x1 + 2, x2 + 3, x3 + 4, x4 + 5);
    fx_plus_fy =  f(x1, x2, x3, x4) + f(2, 3, 4, 5);
     if ~(abs(f_x_plus_y - fx_plus_fy) < 1e4*eps(min(abs(f_x_plus_y),abs(fx_plus_fy))))
        fprintf('Zal2. is not fullfilled. \n')
        y = 0;
        return;
    end
  
    y = 1;
end