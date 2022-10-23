# Zadatak 2. Napisati kod koji generiše periodični signal prikazan na slici ispod.

using Plots

t = 0:0.01:2pi
tm = rem.(t, 1)

y = sin.(t)
y1 = (1) .* ((tm .>= 0) .& (tm .< 0.5))
y2 = (-1) .* ((tm .>= 0) .& (tm .<= 0.5))

y = min.(y1, y)
y = max.(y2, y)

plot(t, y, xticks=0:pi:2pi, title="Druga Funkcija", color=:red)