using Plots

t = 0:0.01:15
tm1 = rem.(t, 2*pi)
tm2 = rem.(t, 2)

y1 = sin.(tm1)
y2 = cos.(tm1)
y3 = (2) .* ((tm2 .> 1) .& (tm2 .<= 2))

y3 = min.(y1, y2)

plot(t, y3)