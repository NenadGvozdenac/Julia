using Plots
using DifferentialEquations
using ControlSystems

s = tf("s")

G1 = 1 / (s+1)
G2 = 1 / (s+2)
G3 = 1 / (s+3)
H  = 1/s

G12 = parallel(G1, G2)
G123 = series(G12, G3)
G = feedback(G123, H)