using LinearAlgebra, Statistics

A = [1 2 3 4; 5 2 3 4; 2 5 6 4; 2 4 5 6]

e, s = 1, 4

function zadatak1(A, e, s)
    parne_vrste = A[2:2:end, :]
    v = parne_vrste[(parne_vrste .> e) .& (parne_vrste .<= s)]
    
    el_ispod = tril(A, -1)
    m = length(el_ispod[el_ispod .> 0])

    return v, m
end

v, m = zadatak1(A, e, s)