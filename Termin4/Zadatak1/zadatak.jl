using Plots
using DifferentialEquations

function f(t)
    tp = rem(t, 2)
    y = (5*tp) * (tp <= 1) + (-5 * tp + 10) * (tp > 1)
end

function diferencijalna_jednacina!(dx, x, p, t)

    m1, m2, c1, c2, c3, k1, k2 = p

    dx[1] = x[2]
    dx[2] = (1/m1) * (k2 * (x[3] - x[1]) - k1 * x[1] - c1 * x[2])
    dx[3] = x[4]
    dx[4] = (1/m2) * (f(t) - c3 * x[4] - c2 * x[4] - k2 * (x[3] - x[1]))

end

m1 = 20.0
m2 = 10.0
c1 = 10.0
c2 = 10.0
c3 = 10.0
k1 = 20.0
k2 = 40.0

parametri = (m1, m2, c1, c2, c3, k1, k2)
opseg = (0.0, 20.0)
pocetni_uslovi = [1.0, 0.0, 2.0, 0.0]

problem = ODEProblem(diferencijalna_jednacina!, pocetni_uslovi, opseg, parametri)
sol = solve(problem)

brzina1 = [x[2] for x in sol.u]
brzina2 = [x[4] for x in sol.u]

opseg1 = 0:0.01:20

pocetni_uslov = plot(opseg1, f.(opseg1), label="f(t)")
krajnje_jednacine = plot(sol.t, [brzina1 brzina2], label=["brzina1" "brzina2"])

~, index_1 = findmax(abs.(brzina1))
~, index_2 = findmax(abs.(brzina2))

plot!([sol.t[index_1]], [brzina1[index1]], markershape=:o, label="max brzina1")
plot!([sol.t[index_2]], [brzina2[index2]], markershape=:o, label="max brzina2")

plot(pocetni_uslov, krajnje_jednacine, layout=(2,1))

pozicija_1 = [x[1] for x in sol.u]
pozicija_2 = [x[3] for x in sol.u]

put_1 = sum(abs.(diff(pozicija_1)))
put_2 = sum(abs.(diff(pozicija_2)))

println("Ukupan predjeni put 1. i 2. tela je:\n$put_1\n$put_2")