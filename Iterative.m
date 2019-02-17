%GHILESCU TEODOR-ANDREI 314B
function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  %citirea din fisier
  fid = fopen(nume, 'r')
  N = fscanf(fid, "%d", 1)
  A(N,N) = 0
  L(1:N) = 0
  for i = 1:N
    a = fscanf(fid, "%d", 1)
    b = fscanf(fid, "%d", 1)
    for j = 1:b
      c = fscanf(fid, "%d", 1)
      if i != c
        A(i,c) = 1
        L(i)++
      endif
    endfor
  endfor
  %construirea matricei M
  M(N,N) = 0
  for i = 1:N
    for j = 1:N
      if A(j,i) == 1
        M(i,j) = 1/L(j)
      else
        M(i,j) = 0
      endif
    endfor
  endfor
  %determinarea lui R unde R = R(t) si Raux = R(t+1)
  R(1:N,1) = 1/N
  Raux(1:N,1) = 0
  One(1:N,1) = 1
  while(1)
    Raux = d*M*R + (1-d)/N * One
    if abs(Raux - R) < eps
      break
    endif
    R = Raux
  endwhile
  fclose(fid)
endfunction
	