using Plots

t = 0:0.01:4
tm = rem.(t, 2)

y1 = sqrt.(1 .- ((tm .- 1) .^ 2))
y2 = ((2 .* tm) .* ((tm .>= 0) .& (tm .< 1))) .+ ((-2 .* tm .+ 4) .* ((tm .>= 1) .& (tm .<= 2)))

y = min.(y1, y2)


plot(t, y1, ls=:dash, label="kruznica", color=:blue, ylabel="y", xlabel="t")
plot!(t, y2, ls=:dash, label="trougao", color=:red)
plot!(t, y, linewidth=3, color=:green, label="y")