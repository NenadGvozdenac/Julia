using Plots
using DifferentialEquations

function f(t)

    tp = rem(t, 1)

    y = (1/2 * t) * (t <= 10)
    y1 = (5) * (tp <= 0.5) + (0) * (tp >= 0.5)

    y3 = min(y, y1)
end

function diferencijalna_jednacina!(dx, x, p, t)

    m1, m2, c1, c2, k1, k2, g = p

    dx[1] = x[2]
    dx[2] = (1/m1) * (m1*g + k2 * (x[3] - x[1]) - k1 * x[1] - x[2] * c1)
    dx[3] = x[4]
    dx[4] = (1/m2) * (f(t) + m2*g - k2 * (x[3] - x[1]) - c2 * x[4])

end

m1 = 20.0
m2 = 10.0
c1 = 10.0
c2 = 10.0
k1 = 20.0
k2 = 40.0
g = 9.81

parametri = (m1, m2, c1, c2, k1, k2, g)
opseg = (0.0, 10.0)
pocetni_uslovi = [-1.0, 0.0, -1.0, 0.0]

problem = ODEProblem(diferencijalna_jednacina!, pocetni_uslovi, opseg, parametri)
sol = solve(problem)

pozicija_m1 = [x[1] for x in sol.u]
brzina_m1 = [x[2] for x in sol.u]
pozicija_m2 = [x[3] for x in sol.u]
brzina_m2 = [x[4] for x in sol.u]

prva_jednacina = plot(0:0.01:10, f.(0:0.01:10), label="f(t)")
druga_jednacina = plot(sol.t, [pozicija_m1, brzina_m1], label=["Pozicija m1" "Brzina m1"])

a = diff(brzina_m1) ./ diff(sol.t)

~, najveca_brzina = findmax(abs.(a))

treca_jednacina = plot(sol.t[1:end-1], [a], label="Brzina m1")
plot!([sol.t[najveca_brzina]], [a[najveca_brzina]], label="Najveca brzina m1", markershape=:o, color=:red)

plot(prva_jednacina, druga_jednacina, treca_jednacina, layout=(3,1), xlabel="t", ylabel="y", xticks=0:1:10)