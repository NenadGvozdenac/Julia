using ControlSystems

A = [0 1; 0 -12.5]
B = [0; 38.9]
C = [0 1]
D = 0
m = ss(A, B, C, D)