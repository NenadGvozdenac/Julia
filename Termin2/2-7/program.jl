using Plots

t = 0:0.001:2

y = sqrt.(1 .- ((t .- 1) .^ 2))

plot(t, y, label="kruznica", xticks=0:1:2, yticks=0:0.25:1)
xlabel!("t")
ylabel!("y")