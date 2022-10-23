# Zadatak 4. Napisati kod koji generiše periodični signal prikazan na slici ispod.

t = 0:0.01:9

tm = rem.(t, 2pi)

y = 2 * sin.(tm)
y1 = (1) .* ((tm .< pi))
y2 = (-1) .* ((tm .>= pi))

y = min.(y, y1)
y = max.(y, y2)

plot(t, y, label="sin(t)", xticks=0:1:9, title="Cetvrta Funkcija")
xaxis!("t")
yaxis!("y")