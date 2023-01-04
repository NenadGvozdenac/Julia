using ControlSystems
using Plots
using DifferentialEquations

function sistem(dx, x, p, t)

    e = funkcija_r(t) - 0.5 * x[2]
    q = x[1]^2

    dx[1] = 4*e - x[1]
    dx[2] = x[3]
    dx[3] = q - 4 * x[2] * (x[3]^2) - x[2]

end

function funkcija_r(t)

    y = 4/10 .* t
    tp = rem.(t, 2)
    y1 = 4 .* (tp .<= 1) .+ 0 .* (tp .> 1)

    return min.(y, y1)

end

time = (0.0, 10.0)
pocetni_uslovi = [0.0, -1.0, 1.0]

problem = ODEProblem(sistem, pocetni_uslovi, time)
sol = solve(problem)

izlaz = [x[2] for x in sol.u]

plot1 = plot(sol.t, funkcija_r(sol.t), label="r(t)", xlabel="t". ylabel="r")
plot2 = plot(sol.t, izlaz, label="y(t)", xlabel="t". ylabel="r")
plot(plot1, plot2, layout=(2,1), lw=2)

# plot(0:0.01:8, funkcija_r(0:0.01:8), label="r(t)", xlabel="t", ylabel="r", xticks=0:1:8)
# ^ Testiranje r(t), funkcija radi normalno
# Zadatak nije dobro postavljen => ne moze se kompajlirati, problem je lose definisan