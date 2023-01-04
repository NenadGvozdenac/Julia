using ControlSystems, Plots, DifferentialEquations

function sistem1(dx, x, p, t)

    dx[1] = x[2]
    dx[2] = 0.5 * u(t) - x[1]*x[2] + x[1]

end

function u(time)
    tp = rem.(time, 8)
    y = (tp) .* (tp .<= 2) .+ (2) .* ((tp .> 2) .& (tp .<= 6)) .+ (-tp .+ 8) .* (tp .> 6)
end

function sistem2()
    G1 = tf([1, 4], [1, 1, 2])
    G2 = tf([5], [5, 4])
    
    feedback(G1, G2)
end

function p(y)
    return (3 .* (y .<= -3)) .+ ((-3/4 .* y .+ 3/4) .* ((y .> -3) .& (y .< 1))) .+ ((0) .* (y .>= 1))
end

time = (0.0, 8.0)
pocetni_uslovi = [-1.0, 0.5]

prob = ODEProblem(sistem1, pocetni_uslovi, time)
sol = solve(prob)

signal = u(0:0.01:8)

G = sistem2()
k, ~, ~ = lsim(G, signal', 0:0.01:8)

sol_interpolirano = sol(0:0.01:8)

y = [x[1] for x in sol_interpolirano.u]

funkcija_p = p(y)

z = funkcija_p .+ k'

plot1 = plot(0:0.01:8, z, label="z(t)", xlabel="z", ylabel="t")
plot2 = plot(-5:0.01:3, p(-5:0.01:3), label="p(y)", xlabel="p", ylabel="y")
plot3 = plot(0:0.01:8, u(0:0.01:8), label="u(t)", xlabel="u", ylabel="t")

plot(plot1, plot2, plot3, layout=(3, 1), size=(600, 600), xticks=-10:1:10, lw=2)