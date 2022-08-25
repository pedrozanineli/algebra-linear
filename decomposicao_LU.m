clc
clear all

A = [0 0.6 0.7 0 0 0.8 0 0; 0 0.4 0 0.7 0.1 0.7 0.8 0; 0 0 0 0 0 0 0 1; 0.5 0.6 0.4 0.1 0 0.8 0.4 0; 1 0.9 1 0 0 1 0 0; 0.8 0.4 0.8 0.7 0.8 1 0.7 0.1; 0 0.2 0 0.6 0 0 0 0; 1 0.7 0.2 1 0 0.8 0 0];

n = length(A);

P = eye(n);

L = zeros(n,n);
U = zeros(n,n);

%
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
      pause
    endif
  
    if indice_pivo != k
      for j=1:n
        troca = A(k,j);
        A(k,j) = A(indice_pivo,j);
        A(indice_pivo,j) = troca;
        
        troca = P(k,:);
        P(k,:) = P(j,:);
        P(j,:) = troca;
      endfor
    endif
  endfor
  
  # Gauss Elimination
  
  for i=k+1:n
    m(i,k) = A(i,k)/A(k,k);
    A(i,k) = 0;
    for j=k+1:n
      A(i,j) = A(i,j) - m(i,k)*A(k,j);
    endfor
  endfor
endfor
%

# Valores de M


U = A;

for i=1:n #linhas
  for j=1:n #colunas
    
    if i == j
      L(i,j) = 1;
    endif
    
    if i > j
      L(i,j) = m(i,j);
    endif
    
  endfor
endfor

L
U
