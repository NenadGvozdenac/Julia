using ControlSystems, DifferentialEquations, Plots

function sistem(dx, x, p, t)

    y = x[1] - 2*x[2]

    r = sin(2*t)
    u = r - 0.1 * y^2

    dx[1] = -0.1 * x[1] + 0.25 * x[2]
    dx[2] = -0.5 * x[1] + 0.75 * u

end

time = (0.0, 5.0)
pocetni_uslovi = [0.5, -0.2]
problem = ODEProblem(sistem, pocetni_uslovi, time)
sol = solve(problem)

r = sin.(2*sol.t)

x1 = [x[1] for x in sol.u]
x2 = [x[2] for x in sol.u]
y = x1 - 2 * x2

plot(sol.t, [y, r], label=["y(t)" "r(t)"], lw=2)