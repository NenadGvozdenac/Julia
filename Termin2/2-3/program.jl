# Zadatak 3. Napisati kod koji generiše periodični signal prikazan na slici ispod.

t = 0:0.01:10

tm = rem.(t, 2)

y = 2/5 * t
y1 = (4) .* ((tm .< 1))

y = min.(y, y1)

plot(t, y, xticks=0:1:10, title="Treca funkcija", label="Funkcija")
xlabel!("x-osa")
ylabel!("y-osa")