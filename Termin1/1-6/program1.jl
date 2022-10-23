# Zadatak 6. Napisati funkciju koja za zadate kvadratne matrice A i B istih dimenzija određuje:
# vektor m koji se sastoji od elemenata ispod glavne dijagonale matrice A koji su
# pozitivni celi brojevi deljivi sa 3.
# skalar s koji predstavlja srednju vrednost elemenata sa sporedne dijagonale matrice
# B koji su veći od srednje vrednosti elemenata sa glavne dijagonale matrice A.

using LinearAlgebra, Statistics

A = round.(rand(6, 6) * 100)
B = round.(rand(6, 6) * 100)

function funkcija(A, B) 
    m = A[(tril(A, -1) .> 0) .& (mod.(tril(A, -1), 3) .== 0)]

    srednjaVrednostElGlavneDijagonaleA = mean(diag(A))
    
    s = mean(diag(reverse(B, dims=2))[(diag(reverse(B, dims=2)) .> srednjaVrednostElGlavneDijagonaleA)])

    return m, s
end

m, s = funkcija(A, B)