# Napisati funkciju koja određuje zbir svih elemenata matrice A,
# Xm
# i=1
# Xn
# j=1
# Aij
# gde je m broj vrsta, a n broj kolona, koji imaju osobinu da je zbir indeksa (i + j)
# paran broj (A11 + A13 + ...)

function zbirSvihElemenataSaParnimIndeksom(A)

    maska = zeros(Bool, 5, 5)

    maska[1:2:end, 1:2:end] .= 1
    maska[2:2:end, 2:2:end] .= 1

    return sum(A[maska])
end

A = [1 2 3 4 2; 2 3 42 5 4; 2 3 42 1 5; 23 4 2 5 5; 2 23 4 2 1]

zbirSvihElemenataSaParnimIndeksom(A)