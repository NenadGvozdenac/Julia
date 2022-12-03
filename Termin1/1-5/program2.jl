# Zadatak 5. Napisati funkciju koja za zadatu kvadratnu matricu A, određuje:
# vektor m koji se formira od elemenata sa glavne dijagonale matrice A.
# skalar s koji predstavlja srednju vrednost elemenata iznad glavne dijagonale matrice
# A. (može se koristiti funkcija mean() iz programskog paketa Statistics)

using Statistics, LinearAlgebra

function funkcija(A)
    m = diag(A) # glavna dijagonala

    iznadDiagonale = ones(size(A))
    iznadDiagonale = triu(iznadDiagonale, 1)
    
    maska = convert.(Bool, iznadDiagonale)
    vektor = A[maska]

    s = mean(vektor)

    return m, s
end

A = round.(rand(5, 5) * 100)

m, s = funkcija(A)