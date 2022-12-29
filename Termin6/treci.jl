using ControlSystems
using Plots

G = tf(38, [1, 5, 6])   # Funkcija Prenosa - 38 / (s^2 + 5s + 6)
y, t, x = step(G, 5)    # Step funkcija ulaz

plot(t, x', label=["x1(t)" "x2(t)"], lw=2, xlabel="t", ylabel="x(t)")
# Plotovanje, uvek raditi transponovanje sa '
# Sistem drugog reda dif. jednacina, jer pol najveci stepen je 2
# Plotujemo promenljive stanja