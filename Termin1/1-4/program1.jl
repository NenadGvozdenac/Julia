# Napisati funkciju koja određuje zbir svih elemenata matrice A,
# Xm
# i=1
# Xn
# j=1
# Aij
# gde je m broj vrsta, a n broj kolona, koji imaju osobinu da je zbir indeksa (i + j)
# paran broj (A11 + A13 + ...)

A = round.(rand(10, 10) * 100)

maska = convert.(Bool, zeros(size(A)))
maska[1:2:end, 1:2:end] .= 1
maska[2:2:end, 2:2:end] .= 1

vrednost = sum(A[maska])