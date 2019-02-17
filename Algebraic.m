%GHILESCU TEODOR-ANDREI 314CB

function R = Algebraic(nume, d)
  %citire din fisier
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
  %determinarea matricii de page-rank-uri
  I = eye(N,N)
  Inv = GramSchmidt(I - d*M)
  One(1:N,1) = 1
  R = Inv * (1-d)/N * One
endfunction
