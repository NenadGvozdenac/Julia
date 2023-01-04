using ControlSystems
using Plots
using DifferentialEquations

function sistem1(dx, x, p, t)

    e = funkcija_r.(t) - x[5]
    p = x[2] + 3*x[1]
    q = p^2

    dx[1] = x[2]
    dx[2] = e - x[1]
    dx[3] = x[4]
    dx[4] = 1/2 * (0.5 * q - x[3] - 4 * x[3] * x[4]^2)
    dx[5] = 2 * x[3] - 2 * x[5]
end

function sistem2(dx, x, p, t)

    e = funkcija_r.(t) - x[5]
    p = x[2] + 3*x[1]
    q = sqrt(p < 0 ? 0 : p)

    dx[1] = x[2]
    dx[2] = e - x[1]
    dx[3] = x[4]
    dx[4] = 1/2 * (0.5 * q - x[3] - 4 * x[3] * x[4]^2)
    dx[5] = 2 * x[3] - 2 * x[5]
end

function funkcija_r(t)
    return 2 * ((t >= 4) ? 1.0 : 0.0)
end

vreme = (0.0, 10.0)
pocetni_uslovi = [0.0, 0.0, -1.0, 1.0, 0.0]

problem1 = ODEProblem(sistem1, pocetni_uslovi, vreme)
sol1 = solve(problem1)

problem2 = ODEProblem(sistem2, pocetni_uslovi, vreme)
sol2 = solve(problem2)

u = funkcija_r.(0:0.01:10)
y1 = [x[3] for x in sol1.u]
y2 = [x[3] for x in sol2.u]

plot1 = plot(0:0.01:10, u, label="u(t)", xlabel="t", ylabel="u")
plot2 = plot(sol1.t, y1, label="y1(t) [p²]", xlabel="t", ylabel="y")
plot3 = plot(sol2.t, y2, label="y2(t) [√p]", xlabel="t", ylabel="y")

plot(plot1, plot2, plot3, layout=(3, 1), size=(600, 600), lw=2, xticks=0:1:10)