# Napisati funkciju koja određuje zbir svih elemenata matrice A,
# Xm
# i=1
# Xn
# j=1
# Aij
# gde je m broj vrsta, a n broj kolona, koji imaju osobinu da je zbir indeksa (i + j)
# paran broj (A11 + A13 + ...)

function funkcija(A)

    matrica = zeros(size(A))
    matrica = convert.(Bool, matrica)
    matrica[1:2:end, 1:2:end] .= 1
    matrica[2:2:end, 2:2:end] .= 1
    
    matrica
    vrednosti = A[matrica]
    
    suma = sum(vrednosti)

    return suma
end

A = round.(rand(5, 5) * 50)
funkcija(A)