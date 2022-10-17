# Zadatak 6. Napisati funkciju koja za zadate kvadratne matrice A i B istih dimenzija određuje:
# vektor m koji se sastoji od elemenata ispod glavne dijagonale matrice A koji su
# pozitivni celi brojevi deljivi sa 3.
# skalar s koji predstavlja srednju vrednost elemenata sa sporedne dijagonale matrice
# B koji su veći od srednje vrednosti elemenata sa glavne dijagonale matrice A.

using LinearAlgebra, Statistics

function funkcija(A, B) # matrica A i B, istih dimenzija, kvadratne
    matricaIspod = tril(A, -1)

    m = A[(matricaIspod .> 0) .& (rem.(matricaIspod, 3) .== 0) .& (isinteger.(matricaIspod))]

    srednjaVrednostElemenataGlavneDijagonaleA = mean(diag(A))

    B = reverse(B, dims=2)

    sporednaDijagonalaB = diag(B)

    vektorElemenataDobrih = sporednaDijagonalaB[sporednaDijagonalaB .> srednjaVrednostElemenataGlavneDijagonaleA]

    s = mean(vektorElemenataDobrih)

    return m, s
end

A = [1 2.2 3 4 5; 3 4.5 2 5 3; 6.2 43 2 1 4; 15 15 2 5 2]
B = [2 3 1 5 7; 2 6 7 6 6; 2 1 5 4 1; 2 67 5 15 3]

m, s = funkcija(A, B)

# m - vektor pozitivnih brojeva deljivih sa tri

print("Vektor pozitivnih celih brojeva [m]: ")
println(m)

print("Skalar srednje vrednosti elemenata sa sporedne dijagonale matrice koji su veci od srednje vrednosti elemenata sa glavne dijagonale matrice A: ")
println(s)