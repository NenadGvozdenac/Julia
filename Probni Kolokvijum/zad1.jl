using Plots

t = 0:0.01:20
tm = rem.(t, 2pi)

y1 = 2 .* sin.(tm)
y = 2 .* sin.(tm) .* ((tm .<= pi/2))

plot(t, y, label="f", width=3, xticks=0:1.5:19.5, yticks=-2:1:2)
plot!(t, y1, label="sin", ls=:dash)