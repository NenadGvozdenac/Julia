using Plots

t = 0:0.01:15
tm = rem.(t, 3)

y = (3 * tm) .* ((tm .>= 0) .& (tm .< 1))
y .+= (3) .* ((tm .>= 1) .& (tm .< 2))
y .+= (-3 * tm .+ 9) .* ((tm .>= 2) .& (tm .<= 3))

plot(t, y, xticks=0:1:15)
ylabel!("y")
xlabel!("t")