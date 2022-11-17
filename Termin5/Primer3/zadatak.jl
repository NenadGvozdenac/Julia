using Plots, DifferentialEquations

function sistem!(dx, x, p, t)

    m, c1, c2, k1, k2, g = p
    f = sin(t)

    dx[1] = x[2]
    dx[2] = 1/m * (m * g - k2 * (x[1] - x[3]) - c1 * x[2] - k1 * x[1])
    dx[3] = (1/(9 * c2)) * (k2 * (x[1] - x[3]) - 3*f)

    # m, c1, c2, k1, k2, g = p
    # f = sin(t)
    # dx[1] = x[2]
    # dx[2] = (1 / m) * (m * g - k1 * x[1] - k2 * (x[1] - x[3]) - c1 * x[2])
    # dx[3] = (k2 * (x[1] - x[3]) - 3 * f) / (9 * c2)


end

pocetne_vrednosti = [-1.0, 0.0, 0.0]
parametri = (10.0, 10.0, 10.0, 15.0, 10.0, 9.81)
opseg = (0.0, 100.0)

prob = ODEProblem(sistem!, pocetne_vrednosti, opseg, parametri)
sol = solve(prob)

promena_brzine = [x[2] for x in sol.u]
plot(sol.t[sol.t .<= 20], promena_brzine[sol.t .<= 20], label="v(t)", lw=2)