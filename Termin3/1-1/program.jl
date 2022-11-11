# Odrediti numeričko rešenje diferencijalne jednačine za prvih 5 sekundi i uporediti
# ga sa analitičkim rešenjem, ako je α = 1 i λ = 1.

using DifferentialEquations
using Plots

function diff_jednacina!(dy, y, param, t) 
    alfa, lambda = param
    dy[1] = lambda * exp(-alfa * t) * y[1]
    return dy
end

function analiticko_resenje(t, y0, param)
    alfa, lambda = param
    y = y0 * exp.((lambda / alfa) * (1 .- exp.(-alfa * t)))
    return y
end

opseg = (0.0, 5.0)

alfa = 1.0
lambda = 1.0
parametri = (alfa, lambda)

y0_pocetni = 1.0
y0 = [1.00]

sol = ODEProblem(diff_jednacina!, y0, opseg, parametri)
solution = solve(sol)   # resenje

opseg2 = 0:0.01:5

solution2 = analiticko_resenje(opseg2, y0_pocetni, parametri) # resenje

plot(solution(opseg2), xlabel = "num.t", ylabel = "num.y", label="Numericko")
plot!(opseg2, solution2, label= "Analiticko")