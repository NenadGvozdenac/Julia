using Plots, DifferentialEquations

function jednacina(t)

    tp = rem.(t, 2)
    y1 = sqrt.(2 .* tp .- tp .^ 2)
    y2 = (2 .* tp) .* (tp .< 1) .+ ((-2 .* tp) .+ 4) .* (tp .>= 1)

    y = min.(y1, y2)

end

function sistem!(dx, x, p, t)

    m, c1, c2, k1, k2, R, L1, L2 = p

    J = (m*R^2)/2

    f = jednacina(t)

    dx[1] = x[2]
	dx[2] = (-1/J) * (k1 * x[1] + k2 * R * (R * x[1] + x[3]) + c1 * R^2 * x[2])
	dx[3] = (L1 / (c2 * L2 ^ 2)) * (L1 * (f - k2 * (R * x[1] + x[3])))
end

opseg = (0.0, 100.0)
m=10.0
c1=10.0
c2=8.0
k1=10.0
k2=15.0
R=1.0
L1=1
L2=2

pocetni_uslovi = [0.0, 0.0, 0.0]
parametri = (m, c1, c2, k1, k2, R, L1, L2)

problem = ODEProblem(sistem!, pocetni_uslovi, opseg, parametri)
sol = solve(problem)

pocetna = plot(0:0.01:10, jednacina(0:0.01:10), ylims=(0, 2), xticks=0:10)

pomeraj1 = [x[1] for x in sol.u]
brzina1 = [x[2] for x in sol.u]
pomeraj2 = [x[3] for x in sol.u]

krajnja = plot(sol.t, [pomeraj1, pomeraj2], label=["Pomeraj1" "Pomeraj2"], lw=2)

ugaono_ubrzanje = diff(brzina1) ./ diff(sol.t)

ubrzanje = plot(sol.t[1:end-1], [ugaono_ubrzanje], label="Ubrzanje", lw=2)

~, max_ubrzanje = findmax(abs.(ugaono_ubrzanje))

scatter!(ubrzanje, [sol.t[max_ubrzanje]], [ugaono_ubrzanje[max_ubrzanje]], markerstyle=:circle, label="Max ubrzanje")

plot(pocetna, krajnja, ubrzanje, layout=(3,1))