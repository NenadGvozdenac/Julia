# Zadatak 1. Odrediti rešenja diferencijalnih jednačina za početnih 30 sekundi, ako
# je α = 10, β = 27 i γ =
# 8
# 3
# , za početne uslove:
# 1. x(0) = 1, y(0) = 0, z(0) = 0.
# 2. x(0) = 1, y(0) = 0.01, z(0) = 0.01.
# Dobijena rešenja za oba slučaja prikazati na jednom grafiku.
# x˙ = α(y − x)
# y˙ = x(β − z) − y
# z˙ = xy − γz

using DifferentialEquations, Plots

function diff_jednacina!(dx, x, param, t) 

    alfa, beta, gama = param

    dx[1] = alfa * (x[2] - x[1])
    dx[2] = x[1] * (beta - x[3]) - x[2]
    dx[3] = x[1] * x[2] - gama * x[3]

end

alfa = 10.0
beta = 27.0
gama = 2.66

parametri = (alfa, beta, gama)

opseg = (0.0, 30.0)

pocetniUslovi1 = [1.0, 0.0, 0.0]
pocetniUslovi2 = [1.0, 0.01, 0.01]

problem1 = ODEProblem(diff_jednacina!, pocetniUslovi1, opseg, parametri)
problem2 = ODEProblem(diff_jednacina!, pocetniUslovi2, opseg, parametri)

sol1 = solve(problem1)
sol2 = solve(problem2)

plot(sol1)
plot!(sol2)