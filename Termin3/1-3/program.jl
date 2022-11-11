# Zadatak 2. Odrediti rešenja diferencijalnih jednačina, ako je A = 12, B = 8,
# C = 4, dok je ulazni signal F(t) prikazan na grafiku ispod.

using DifferentialEquations, Plots

function F(t)
    tm = rem(t, 3)
    y = (4*tm) * (tm <= 1) + (4) * ((tm > 1) & (tm <= 2)) + 0 * ((tm > 2) & (tm <= 3)) 
end

function diferencijalna_jedinacina!(dx, x, param, t)

    A, B, C = param

    dx[1] = x[2]
    dx[2] = -3 * x[2] - C * (x[2] - x[4]) - B * (x[1] - x[3])
    dx[3] = x[4]
    dx[4] = 1/2*(C * (x[2] - x[4]) - A * x[3] + B * (x[1] - x[3]) + F(t))

end

A = 12.0
B = 8.0
C = 4.0

parametri = (A, B, C)

opseg = (0.0, 9.0)

pocetni_uslovi = [0.0, 0.0, 0.0, 0.0]

problem = ODEProblem(diferencijalna_jedinacina!, pocetni_uslovi, opseg, parametri)
sol = solve(problem)

opseg = 0:0.01:9

plot_pocetni_signal = plot(opseg, F.(opseg))

plot_diff_signal = plot(sol)

plot(plot_pocetni_signal, plot_diff_signal, layout= (2, 1))
