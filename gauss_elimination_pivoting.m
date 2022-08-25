clc
clear all

# Gauss Elimination Pivoting Method

#A = [1 3 -1 ; 2 6 1 ; -1 1 4];
#b = [1 ; 0 ; 2];

A=[0 0.6 0.7 0 0 0.8 0 0; 0 0.4 0 0.7 0.1 0.7 0.8 0; 0 0 0 0 0 0 0 1; 0.5 0.6 0.4 0.1 0 0.8 0.4 0; 1 0.9 1 0 0 1 0 0; 0.8 0.4 0.8 0.7 0.8 1 0.7 0.1; 0 0.2 0 0.6 0 0 0 0; 1 0.7 0.2 1 0 0.8 0 0];
b=[0.7; 0.9; 0.8; 0.7; 0; 0.6; 0.7; 0.5];


n = length(A);

for k=1:(n-1)
  
  # Partial Pivoting

  pivo = A(k,k);
  indice_pivo = k;
  
  for i=(k+1):n
    if abs(A(i,k)) > pivo
      pivo = A(i,k);
      indice_pivo = i;
    endif
  
    if pivo == 0
      printf('Matriz singular');
      pause
    endif
  
    if indice_pivo != k
      for j=1:n
        troca = A(k,j);
        A(k,j) = A(indice_pivo,j);
        A(indice_pivo,j) = troca;
      endfor
      troca = b(k);
      b(k) = b(indice_pivo);
      b(indice_pivo) = troca;
    endif
  endfor
  
  # Gauss Elimination
  
  for i=k+1:n
    m = A(i,k)/A(k,k);
    b(i) = b(i) - (m*b(k));
    A(i,k) = 0;
    for j=k+1:n
      A(i,j) = A(i,j) - m*A(k,j);
    endfor
  endfor
endfor # Octave: end for, Matlab: end

x(n) = b(n)/A(n,n);
for k=(n-1):-1:1
  s = 0;
  for j=(k+1):n
    s = s + A(k,j)*x(j);
    x(k) = (b(k)-s)/A(k,k);
  endfor
endfor

A
x