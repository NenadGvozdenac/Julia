using DifferentialEquations
using Plots

function f(t)
    return cos(t)
end

function diferencijalna_jedinacina!(dx, x, p, t)

    m, c, k, g = p

    dx[1] = x[2]
    dx[2] = 1/m * (f(t) + m * g - c * x[2] - k * x[1])

end

opseg = (0.0, 20.0)
m = 5.0
c = 10.0
k = 20.0
g = 9.81

parametri = (m, c, k, g)
pocetni_uslovi = [0.0, 0.0]

problem = ODEProblem(diferencijalna_jedinacina!, pocetni_uslovi, opseg, parametri)
sol = solve(problem)

opseg = 0:0.01:20
pocetni_uslov = plot(opseg, f.(opseg), xticks=0:3.14:20, lw=2, xlabel="t", ylabel="y")
resenje = plot(sol, xticks=0:1:20, lw=2, xlabel="t", ylabel="y")

plot(pocetni_uslov, resenje, layout=(2, 1))