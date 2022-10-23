# Zadatak 5. Napisati funkciju koja za zadatu kvadratnu matricu A, određuje:
# vektor m koji se formira od elemenata sa glavne dijagonale matrice A.
# skalar s koji predstavlja srednju vrednost elemenata iznad glavne dijagonale matrice
# A. (može se koristiti funkcija mean() iz programskog paketa Statistics)

using Statistics, LinearAlgebra

function funkcija(A)
    m = diag(A)         # Dijagonala glavna

    M = ones(size(A))   # Popunjavanje memorije
    M = triu(M, 1)      # vraca matricu -> matrica sa elementima iznad glavne linije i dalje prisutnim

    m_boolean = convert.(Bool, M)       # Konvertujemo u boolean, praveci masku
    el_iznad_sporedne = A[m_boolean]    # ovim ustvari dobijamo sve elemente na osnovu maske

    s = mean(el_iznad_sporedne)         # Srednja vrednost elemenata koji su preostali

    return m, s # Vracamo m i s
end

kvadratnaMatrica = [1 2 3 4 5; 6 7 8 9 10; 1 4 5 2 3; 2 6 1 5 15; 2 6 7 10 15]  # Primer matrice

println("Glavna matrica: ")
println(kvadratnaMatrica)   # Ispisujemo matricu

m, s = funkcija(kvadratnaMatrica)   # Dobijamo vrednosti m, s

println("Glavna dijagonala: ")      # Ispisujemo ih
println(m)

println("Srednja vrednost elemenata iznad glavne dijagonale: ")
println(s)