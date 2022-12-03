# Zadatak 6. Napisati funkciju koja za zadate kvadratne matrice A i B istih dimenzija određuje:
# vektor m koji se sastoji od elemenata ispod glavne dijagonale matrice A koji su
# pozitivni celi brojevi deljivi sa 3.
# skalar s koji predstavlja srednju vrednost elemenata sa sporedne dijagonale matrice
# B koji su veći od srednje vrednosti elemenata sa glavne dijagonale matrice A.

function funkcija(A, B)

    ispodGlavneA = tril(A, -1)
    m = ispodGlavneA[(ispodGlavneA .> 0) .& (ispodGlavneA .% 3 .== 0) .& (isinteger.(ispodGlavneA))]

    reverseB = reverse(B, dims=2)
    sporednaDiagonalaB = diag(reverseB)

    glavnaDiagA = diag(A)
    srednjaVrednost = mean(glavnaDiagA)

    elementiVeciOdSrednje = sporednaDiagonalaB[sporednaDiagonalaB .> srednjaVrednost]

    s = mean(elementiVeciOdSrednje)

    return m, s

end

A = round.(rand(5, 5) * 50)
B = round.(rand(5, 5) * 50)

ispodGlavneA = tril(A, -1)
    m = A[(ispodGlavneA .> 0) .& (ispodGlavneA .% 3 .== 0) .& (isinteger.(ispodGlavneA))]

    reverseB = reverse(B, dims=2)
    sporednaDiagonalaB = diag(reverseB)

    glavnaDiagA = diag(A)
    srednjaVrednost = mean(glavnaDiagA)

    elementiVeciOdSrednje = sporednaDiagonalaB[sporednaDiagonalaB .> srednjaVrednost]

    s = mean(elementiVeciOdSrednje)