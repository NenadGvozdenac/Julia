# Zadatak 5. Napisati funkciju koja za zadatu kvadratnu matricu A, određuje:
# vektor m koji se formira od elemenata sa glavne dijagonale matrice A.
# skalar s koji predstavlja srednju vrednost elemenata iznad glavne dijagonale matrice
# A. (može se koristiti funkcija mean() iz programskog paketa Statistics)

using Statistics, LinearAlgebra

function vrednost(A)
    m = diag(A)
    gornjeVrednosti = triu(A, 1)
    s = mean(gornjeVrednosti)

    return m, s
end

A = round.(rand(7, 7) * 100)

m, s = vrednost(A)