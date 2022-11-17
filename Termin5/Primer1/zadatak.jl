using Plots
using DifferentialEquations

function sistem!(dx, x, p, t)

    m1, m2, c, k1, k2, R, g = p
    f = sin(t)
    J = 1/2 * m1 * R^2

    dx[1] = x[2]
    dx[2] = 1/J * (k2 * (x[3] - R * x[1])*R - k1*x[1] - c*x[2])
    dx[3] = x[4]
    dx[4] = 1/m2 * (f + m2 * g - k2 * (x[3] - R * x[1]))

end

m1 = 10
m2 = 5
c = 10
k1 = 15
k2 = 10
R = 1
g = 9.81

parametri = convert.(Float64, (m1, m2, c, k1, k2, R, g))
pocetni_uslovi = [0.0, 0.0, 2.0, 0.0]
vreme = (0.0, 20.0)

problem = ODEProblem(sistem!, pocetni_uslovi, vreme, parametri)
sol = solve(problem)

pozicija_kruga_ugaona = [x[1] for x in sol.u]
brzina_kruga_ugaona = [x[2] for x in sol.u]
pozicija_tela = [x[3] for x in sol.u]
brzina_tela = [x[4] for x in sol.u]

ubrzanje_kruga_ugaona = diff(brzina_kruga_ugaona) ./ diff(sol.t)

plot(sol.t, [pozicija_kruga_ugaona, brzina_kruga_ugaona], lw=2, label=["Pozicija" "Brzina" "Ubrzanje"])
plot!(sol.t[1:end-1], [ubrzanje_kruga_ugaona], label="Ubrzanje", lw=2)