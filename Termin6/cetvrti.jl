using ControlSystems
using DifferentialEquations
using Plots

G = tf(38, [1, 5, 6])   # Funkcija Prenosa - 38 / (s^2 + 5s + 6)
y, t, x = impulse(G, 5) # Impulsna funkcija
plot(t, y', label="y(t)", lw=2, xlabel="t", ylabel="y(t)")
# Plotovanje izlaza, transponujemo sa y
# Label je jedan element