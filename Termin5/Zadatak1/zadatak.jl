using Plots, DifferentialEquations

function signal(t)

    tp = rem.(t, 8)

    y1 = sin.(pi/4 * tp) .* (tp .< 4) .+ (0) .* (tp .>= 4)
    y2 = (0.5) .* (tp .< 4) .+ (0) .* (tp .>= 4)

    y = min.(y1, y2)

end

function sistem!(dx, x, p, t)

    m1, m2, c, k1, k2, R = p

    f = signal(t)
    J = 1/2 * m1 * R^2

    dx[1] = x[2]
    dx[2] = (-1/J) * (x[1] * (k1 + R^2*k2) + x[2] * (R^2 * c) + x[3] * (k2 * R))
    dx[3] = x[4]
    dx[4] = (1/m2) * (f - k2 * (x[3] + R * x[1]))

end

parametri = [10.0, 5.0, 10.0, 10.0, 15.0, 1]
vreme = (0.0, 20.0)
pocetni_uslovi = [0.0, 2.0, 0.0, 0.0]

problem = ODEProblem(sistem!, pocetni_uslovi, vreme, parametri)
sol = solve(problem)

pomeraj = [x[3] for x in sol.u]
brzina = [x[4] for x in sol.u]

ugaona_brzina = [x[2] for x in sol.u]
ugaono_ubrzanje = diff(ugaona_brzina) ./ diff(sol.t)

prvi_gf = plot(0:0.01:20, signal(0:0.01:20), lw=2, label="Pocetni Signal", xticks=0:2:20, yticks=0:0.25:1, ylims=(0.0, 1.0))
drugi_gf = plot(sol.t, [pomeraj, brzina], label=["Pomeraj" "Brzina"], lw=2)
treci_gf = plot(sol.t, ugaona_brzina, label="Ugaona brzina", lw=2)
plot!(sol.t[1:end-1], ugaono_ubrzanje, lw=2, label="Ugaono ubrzanje")

plot(prvi_gf, drugi_gf, treci_gf, layout=(3,1))
