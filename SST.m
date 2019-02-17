% GHILESCU TEODOR-ANDREI 314CB
%functia care rezolva un sistem superior triunghiular
function X = SST (A, b)
  [N N] = size(A)
  X = zeros(N,1)
  for i = N:-1:1
    s = 0
    for j = i+1:N
      s += A(i,j) * X(j)
    endfor
    X(i) = (b(i) - s)/A(i,i)
  endfor
endfunction
