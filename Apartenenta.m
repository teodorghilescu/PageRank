% Nume, Prenume, Grupa

function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  %din continuitate => ax+b = 0 cand x = val1 si ax+b = 1 cand x = val2
  if x < val1
    y = 0
  elseif x >= val1 && x <= val2
    a = 1/(val2 - val1)
    b = -a * val1
    y = a*x + b
  elseif x > val2
    y = 1
  endif
endfunction
    
	