using DifferentialEquations
using Plots

function f(t)
    tp = rem(t, 5)
    y = ((4 * tp) * (tp <= 1)) + ((4) * ((tp > 1) & (tp < 2))) + ((-2 * tp + 8) * ((tp >= 2) & (tp < 3))) + ((2) * ((tp >= 3) & (tp < 4))) + ((-2 * tp + 10) * (tp >= 4))
end

function diferencijalna_funkcija!(dx, x, p, t)

    m1, m2, c1, c2, c3, k1, k2 = p

    dx[1] = x[2]
    dx[2] = (1/m1) * (f(t) + c1 * (x[4] - x[2]) - k1 * x[1])
    dx[3] = x[4]
    dx[4] = (1/m2) * (-c1 * (x[4] - x[2]) - x[4] * c3 - k2 * x[3] - c2 * x[4])

end

m1 = 10.0
m2 = 15.0
c1 = 20.0
c2 = 20.0
c3 = 20.0
k1 = 40.0
k2 = 40.0

parametri = (m1, m2, c1, c2, c3, k1, k2)
opseg = (0.0, 10.0)
ulazni_parametri = [0.0, 0.0, 0.0, 0.0]

problem = ODEProblem(diferencijalna_funkcija!, ulazni_parametri, opseg, parametri)
sol = solve(problem)

opseg = 0:0.01:10
pocetna_funkcija = plot(opseg, f.(opseg), lw=2, label="f(t)", xlabel="t", ylabel="y", xticks=0:1:10)

poz1 = [x[1] for x in sol.u]
poz2 = [x[3] for x in sol.u]

~, index1 = findmax(abs.(poz1))
~, index2 = findmax(abs.(poz2))

krajnja_funkcija = plot(sol.t, [poz1, poz2], lw=2, label=["x1(t)" "x2(t)"], xlabel = "t", ylabel="y")

plot(pocetna_funkcija, krajnja_funkcija, layout=(2, 1))