using ControlSystems
using Plots
using DifferentialEquations

s = tf("s")

G1 = 1 / (s+1)
G2 = 1 / (s+2)
G3 = 1 / (s+3)
G4 = 1 / (s+4)

G23 = series(G2, G3)
G234 = feedback(G23, G4)
G1234 = series(G1, G234)
G = feedback(G1234)