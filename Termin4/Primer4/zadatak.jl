using Plots
using DifferentialEquations

function diferencijalna_jednacina!(dx, x, p, t)

    m1, m2, c, k1, k2, k3, g = p

    dx[1] = x[2]
    dx[2] = (1/m1) * (m1*g - k1 * x[1] - k2*(x[1] - x[3]))
    dx[3] = x[4]
    dx[4] = (1/m2) * (k2 * (x[1] - x[3]) - k3 * x[3] - c * x[4] - m2*g)

end

m1 = 5.0
m2 = 8.0
c = 10.0
k1 = 20.0
k2 = 20.0
k3 = 20.0
g = 9.81

parametri = (m1, m2, c, k1, k2, k3, g)
opseg = (0.0, 20.0)
pocetni_uslovi = [2.0, 0, 0, 0]

problem = ODEProblem(diferencijalna_jednacina!, pocetni_uslovi, opseg, parametri)
sol = solve(problem)

brzina1 = [x[2] for x in sol.u]
brzina2 = [x[4] for x in sol.u]

~, index1 = findmax(abs.(brzina1))
~, index2 = findmax(abs.(brzina2))

plot(sol.t, [brzina1 brzina2], lw=2)
plot!([sol.t[index1]], [brzina1[index1]], markershape=:o, label="max_v1")
plot!([sol.t[index2]], [brzina2[index2]], markershape=:o, label="max_v2")