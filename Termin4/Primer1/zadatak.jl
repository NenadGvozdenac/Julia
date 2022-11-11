using DifferentialEquations
using Plots

function diff_jednacina!(dx, x, param, t) 

    m, c1, k, c2 = param

    f = sin(t)

    dx[1] = x[2]
    dx[2] = 1/m * (f - c1 * x[2] - k * x[1] - c2 * x[2])

end

m = 10.0
c1 = 20.0
c2 = 20.0
k = 40.0

parametri = (m, c1, k, c2)
opseg = (0.0, 10.0)
pocetni_uslovi = [0.0, 0.0]

problem = ODEProblem(diff_jednacina!, pocetni_uslovi, opseg, parametri)
sol = solve(problem)

plot(sol, label=["x1(t)" "x2(t)"], lw=2, xticks=0:1:10)