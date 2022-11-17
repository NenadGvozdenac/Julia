using Plots, DifferentialEquations

function signal(t)
    tp = rem.(t, 3)
    y = (-1 / 3 * t .+ 5) .* (tp .< 2)
end

function sistem!(dx, x, p, t)

    m1, m2, c, k1, k2, R, g = p

    J = 1/2 * m1 * R^2
    f = signal(t)

    dx[1] = x[2]
    dx[2] = 1/m2 * (m2 * g - k1 * x[1] - f - k2 * (x[1] + R*x[3]))
    dx[3] = x[4]
    dx[4] = -1/J * (R*k2*(x[1] + R*x[3]) + R * c * x[4])

end

pocetni_uslovi = [0.0, 0.0, 0.0, 0.0]
period = (0.0, 15.0)
parametri = (10.0, 5.0, 10.0, 15.0, 10.0, 1.0, 9.81)

problem = ODEProblem(sistem!, pocetni_uslovi, period, parametri)
sol = solve(problem)

ugaoni_pomeraj = [x[3] for x in sol.u]
ugaona_brzina = [x[4] for x in sol.u]

plot(sol.t, [ugaoni_pomeraj, ugaona_brzina], lw=2, label=["Ugaoni pomeraj" "Ugaona brzina"])