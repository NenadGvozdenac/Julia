# Zadatak 5. Napisati kod koji generiše signal prikazan na slici ispod.

using Plots

t = -3:0.01:3

y1 = (t.^2 .- 1)
y2 = (-t.^2 .+ 1)

plot(t, [y1, y2], title="Peta Funkcija")
xaxis!("t")
yaxis!("y")