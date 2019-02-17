% GHILESCU TEODOR-ANDREI 314CB

function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  out = strcat(nume, ".out")
  g = fopen(out, 'w')
  f = fopen(nume, 'r')
  N = fscanf(f, "%d", 1)
  fprintf(g, "%d\n", N)
  %determinarea si afisearea lui R1 prin metoda Iterative
  R1 = Iterative(nume, d, eps)
  for i = 1:N
   fprintf(g, "%0.6f\n", R1(i))
  endfor
  %determinarea si afisarea lui R2 prin metoda Algebraic
  R2 = Algebraic(nume, d)
  fprintf(g, "\n")
  for i = 1:N
   fprintf(g, "%0.6f\n", R2(i))
  endfor
  %determinarea matricii sortate a lui R2
  PR1 = sort(R2, 'descend')
  fprintf(g, "\n")
  %citirea lui val1 si val2, considerand ca indicii sunt >=1 si val < 1
  c = 1
  while(c >= 1)
    c = fscanf(f, "%d", 1)
  endwhile
  val1 = fscanf(f, "%f", 1)
  val2 = fscanf(f, "%f", 1) 
  %afisarea in ordine
  for i = 1:N
    fprintf(g, "%d ", i)
    for j = 1:N
      if PR1(i) == R2(j)
        fprintf(g, "%d ", j)
        break
      endif
    endfor
    F = Apartenenta(PR1(i), val1, val2)
    fprintf(g, "%0.6f\n", F)
  endfor
  fclose('all')
endfunction
   
   