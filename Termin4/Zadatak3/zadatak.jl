using DifferentialEquations
using Plots

function f(t)

    tp = rem(t, 3)
    y = sin(pi/3 * tp)

end

function dif_jednacina!(dx, x, p, t)

    m1, m2, m3, c, k, g = p

    # dx[1] = x[2]
    # dx[2] = (1/m1) * (k*(x[3] - x[1]) + c*(x[4] - x[2]) + m1*g - k*x[1])
    # dx[3] = x[4]
    # dx[4] = (1/m2) * (m2*g + k*(x[5]-x[3]) - k*x[3] - c*(x[4]-x[2]) - k*(x[3]-x[1]))
    # dx[5] = x[6]
    # dx[6] = (1/m3) * (m3*g - k*(x[5] - x[3]) - f(t))

    dx[1] = x[2]
	dx[2] = 1/m1 * (c*(-x[2]+x[4]) - 2*k*x[1] + k*x[3] + m1*g)
	dx[3] = x[4]
	dx[4] = 1/m2 * (c*(x[2]-x[4]) - k*(3*x[3]-x[1]-x[5]) + m2*g)
	dx[5] = x[6]
	dx[6] = 1/m3 * (k*(x[3]-x[5]) + m3*g - f(t))

end

m1 = m3 = 5.0
m2 = 10.0
c = 10.0
k = 15.0
g = 9.81

parametri = (m1, m2, m3, c, k, g)
opseg = (0.0, 12.0)
pocetna_stanja = [0.0, 3.0, 0.0, 3.0, 0.0, 3.0]

problem = ODEProblem(dif_jednacina!, pocetna_stanja, opseg, parametri)
sol = solve(problem)

promena_pozicije_m1 = [x[1] for x in sol.u]
promena_pozicije_m2 = [x[3] for x in sol.u]

~,najvece_udaljenje_m1 = findmax(abs.(promena_pozicije_m1))
~,najvece_udaljenje_m2 = findmax(abs.(promena_pozicije_m2))

pocetni_uslov = plot(0:0.01:12, f.(0:0.01:12))
krajnje_resenje = plot(sol.t, [promena_pozicije_m1 promena_pozicije_m2], label=["m1" "m2"])

plot!([sol.t[najvece_udaljenje_m1]], [promena_pozicije_m1[najvece_udaljenje_m1]], markershape=:o, color=:red, label="Najvece m1")
plot!([sol.t[najvece_udaljenje_m2]], [promena_pozicije_m2[najvece_udaljenje_m2]], markershape=:o, color=:red, label="Najvece m2")

plot(pocetni_uslov, krajnje_resenje, layout=(2,1), xticks=0:1:12, xlabel="t", ylabel="y")