% GHILESCU TEODOR-ANDREI 314CB

function B = GramSchmidt(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se determina Q si R unde A = QR aplicand-se GramSchmidt modificat, apoi
  % se determinat X = [x1 x2 ... xn], unde x(i) este solutia ecuatiei R*x(i) = Q' * i(i)
  [N N] = size(A)
  %determinarea matricelor Q R
  Q = zeros(N, N)
  R = zeros(N, N)
  B = zeros(N, N)
  I = eye(N,N)
  %determinarea matricelor Q R
  C = A;
  for i = 1:N
  R(i,i) = norm(C(:,i));
  Q(:,i)= C(:,i)/R(i,i);
    for j = i+1:N
      R(i,j) = Q(:,i)'*C(:,j);
      C(:,j) = C(:,j)-R(i,j)*Q(:,i);
    endfor
  endfor
  %Rezolvarea sistemului triangulat superior R*x(:,i) = Q'*e(:,i)
  for i = 1:N
    B(:,i) = SST(R, Q' * I(:,i))
  endfor
endfunction