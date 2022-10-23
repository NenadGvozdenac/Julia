# Zadatak 1. Napisati kod koji generiše periodični signal prikazan na slici ispod.

using Plots

t = 0:0.01:10

tm = rem.(t, 5)

y1 = (2 * tm) .* ((tm .>= 0) .& (tm .< 2))
y2 = (2) .* ((tm .>= 2) .& (tm .< 4))
y3 = (10 .- 2 * tm) .* ((tm .>= 4) .& (tm .<= 5))

y = y1 + y2 + y3

plot(t, y, title="Prva Funkcija", color=:red, xticks=0:10)