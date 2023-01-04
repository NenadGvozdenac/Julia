using ControlSystems, DifferentialEquations, Plots

function sistem(dx, x, p, t)

    q = x[1] + v(t)
    e = u(t) - 2 * x[4]

    dx[1] = e - 2 * x[1]
    dx[2] = x[3]
    dx[3] = 3 * q - x[2]
    dx[4] = 4 * x[2] - x[4]

end

function v(t)
    return t >= 3 ? 1.0 : 0.0
end

function u(t)
    tp = rem(t, 5)
    y = ((5 * tp) .* (tp .<= 1)) .+ (5 .* ((tp .> 1) .& (tp .<= 4))) .+ (-5 .* tp .+ 25) .* (tp .>= 4)
end

time = (0.0, 10.0)
pocetni_uslovi = [0.0, 2.0, 1.0, 0.0]
problem = ODEProblem(sistem, pocetni_uslovi, time)
sol = solve(problem)

y = [x[4] for x in sol.u]

plot1 = plot(sol.t, y, label="y(t)", lw=2)
plot2 = plot(sol.t, u.(sol.t), label="u(t)", lw=2)
plot(plot1, plot2, layout=(2, 1), xticks=0:1:10)