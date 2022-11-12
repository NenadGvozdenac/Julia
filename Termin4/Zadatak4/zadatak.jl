using Plots
using DifferentialEquations

function f(t)
    tp = rem(t, 3)

    y1 = (1/3 * tp)
    y2 = sin(pi/3 * tp)

    y = min(y1, y2)
end

function dif_jednacina!(dx, x, p, t)

    m1, m2, c1, c2, k1, k2, g = p

    dx[1] = x[2]
    dx[2] = (1/m1) * (f(t) - c1 * x[2] - k1 * (x[1] - x[3]))
    dx[3] = x[4]
    dx[4] = (1/m2) * (k1 * (x[1] - x[3]) - k2 * x[3] - m2 * g - c2 * x[4])

end

m1 = 10.0
m2 = 8.0
c1 = 5.0
c2 = 10.0
k1 = k2 = 15.0
g = 9.81

parametri = (m1, m2, c1, c2, k1, k2, g)
pocetni_uslovi = [0.0, 0.0, 0.0, 0.0]
opseg = (0.0, 12.0)

problem = ODEProblem(dif_jednacina!, pocetni_uslovi, opseg, parametri)
sol = solve(problem)

promena_pozicije_x1 = [x[1] for x in sol.u]
promena_pozicije_x2 = [x[3] for x in sol.u]

opseg1 = 0:0.01:18
prva_jednacina = plot(opseg1, f.(opseg1), xticks=0:1:18, yticks=0:0.25:1)
druga_jednacina = plot(sol.t, [promena_pozicije_x1 promena_pozicije_x2], xticks=0:1:12)

plot(prva_jednacina, druga_jednacina, layout=(2,1))