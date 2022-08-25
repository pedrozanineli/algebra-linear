clc
clear all

A = [1 2 3 ; 4 5 6 ; 7 8 9]

P = eye(length(A));

troca = P(1,:);
P(1,:) = P(2,:);
P(2,:) = troca;

P

P*A